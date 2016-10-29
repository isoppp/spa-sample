'use strict';

// const DEFAULT_URL = 'http://dev.classmethod.jp/feed/';
const DEFAULT_URL = 'sample.xml';


const getDataFromFeed = ($item) => {
  const link = $item.find('link').text();
  const title = $item.find('title').text();
  const description = $item.find('description').text();

  return {
    link: link,
    title: title,
    description: description
  };
};

const getDataFromHtml = ($target) => {
  const link = $target.find('.js-listItem-link').attr('href');
  const title = $target.find('.js-listItem-title').text();
  const description = $target.find('.js-listItem-description').text();

  return {
    link: link,
    title: title,
    description: description
  }
};


$(() => {
  const $submit = $('.js-submit');

  const $resultList = $('.js-resultList');
  const $resultDetail = $('.js-resultDetail');

  const $template = $('.js-template');
  const $feedList = $template.find('.js-feedList');
  const $feedListItem = $feedList.find('.js-listItem');
  const $feedDetail = $template.find('.js-feedDetail');

  const createFeedItem = ($item) => {
    const $card = $feedListItem.clone();
    const data = getDataFromFeed($item);
    $card.find('.js-listItem-link').attr('href', data.link);
    $card.find('.js-listItem-title').text(data.title);
    $card.find('.js-listItem-description').text(data.description);
    return $card;
  };

  const createFeedDetail = (event) => {
    const data = getDataFromHtml($(event.currentTarget));
    const $detail = $feedDetail.clone();

    $detail.find('.js-feedDetail-title').text(data.title);
    $detail.find('.js-feedDetail-description').text(data.description);
    $detail.find('.js-feedDetail-link').attr('href', data.link);
    $resultDetail.empty().append($detail);
  };

  const createFeedList = ($items) => {
    const $list = $feedList.clone();
    $list.empty();

    $items.each((i, elem) => {
      const $card = createFeedItem($(elem));
      $list.append($card);
    });

    $resultList.append($list);
    $resultList.on('click', '.js-listItem', createFeedDetail);
  };

  const onSuccess = (data) => createFeedList($(data).find("item"));

  $submit.on('click', () => {
    $.ajax(DEFAULT_URL, {
      dataType: "xml",
      success: onSuccess
    });
  });
});
