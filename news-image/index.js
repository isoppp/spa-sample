$(() => {
  // const DEFAULT_URL = 'http://dev.classmethod.jp/feed/';
  const DEFAULT_URL = 'sample.xml';

  function successFunc(data){
    $(data).find("item").each((i,elem)=>{
      const $elem = $(elem);
      const title = $elem.find("title").text();
      const link = $elem.find("link").text();
      const description = $elem.find("description").text();
    })
  }
  $.ajax(DEFAULT_URL, {
    dataType: "xml",
    success: successFunc
  });
});
