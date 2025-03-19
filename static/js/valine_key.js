

function initValine(options) {

  let defaultConfig = {
    el: '#vcomments',
    path: window.location.pathname,
    appId: 'QWAfOTeaWxdVIifjqPslvl9I-gzGzoHsz',
    appKey: 'jHjVHtLQq21Lv9H9JqtnQVGP',
  };


  let finalConfig = Object.assign({}, defaultConfig, options);
  new Valine(finalConfig);
}