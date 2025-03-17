from django.utils.safestring import mark_safe
import copy

class Pagination(object):

    def __init__(self, request, queryset, page_param="page", page_size=9, plus=1):
        '''
        :param request: object of the request
        :param queryset: qualified data (for paging)
        :param page_param: Get paging parameter in url, e.g. /?page=
        :param page_size: show how many data items it contains
        :param plus: show the pages before and after the current page
        '''

        page = request.GET.get(page_param, "1")


        query_dict = copy.deepcopy(request.GET)
        query_dict._mutable = True
        self.query_dict = query_dict

        if page.isdecimal():
            page = int(page)
        else:
            page = 1
        self.page = page
        self.page_size = page_size
        self.param = page_param
        self.start = (page - 1) * page_size
        self.end = page * page_size
        self.page_queryset = queryset[self.start:self.end]

        total_count = queryset.count()
        total_page_count, div = divmod(total_count, page_size)
        if div:
            total_page_count += 1
        self.total_page_count = total_page_count
        self.plus = plus

    def html(self):


        if self.total_page_count <= 2 * self.plus + 1:
            start_page = 1
            end_page = self.total_page_count
        else:

            if self.page <= self.plus:
                start_page = 1
                end_page = 2 * self.plus + 1
            else:

                if (self.page + self.plus) > self.total_page_count:
                    start_page = self.total_page_count - 2 * self.plus
                    end_page = self.total_page_count
                else:
                    start_page = self.page - self.plus
                    end_page = self.page + self.plus

        page_str_list = []

        self.query_dict.setlist(self.param,[1])
        page_str_list.append('<li><a href="?{}">Home Page</a></li>'.format(self.query_dict.urlencode()))

        if self.page > 1:
            self.query_dict.setlist(self.param, [self.page - 1])
            prev = '<li><a href="?{}">Previous Page</a></li>'.format(self.query_dict.urlencode())
        else:
            self.query_dict.setlist(self.param, [1])
            prev = '<li><a href="?{}">Previous Page</a></li>'.format(self.query_dict.urlencode())

        page_str_list.append(prev)
        for i in range(start_page, end_page + 1):
            self.query_dict.setlist(self.param, [i])
            if i == self.page:
                ele = '<li class="active"><a href="?{}">{}</a></li>'.format(self.query_dict.urlencode(), i)
            else:
                ele = '<li><a href="?{}">{}</a></li>'.format(self.query_dict.urlencode(), i)

            page_str_list.append(ele)


        if self.page < self.total_page_count:
            self.query_dict.setlist(self.param, [self.page + 1])
            prev = '<li><a href="?{}">Next Page</a></li>'.format(self.query_dict.urlencode())
        else:
            self.query_dict.setlist(self.param, [self.total_page_count])
            prev = '<li><a href="?{}">Next Page</a></li>'.format(self.query_dict.urlencode())
        page_str_list.append(prev)


        self.query_dict.setlist(self.param, [self.total_page_count])
        page_str_list.append('<li><a href="?{}">Last Page</a></li>'.format(self.query_dict.urlencode()))

        page_string = mark_safe("".join(page_str_list))
        return page_string