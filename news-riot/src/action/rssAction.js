import RiotControl from 'riotcontrol'
import ActionTypes from '../actionTypes';
import axios from 'axios';
import xml2js from 'xml2js';

const parser = new xml2js.Parser();

class RssAction {
  loadRss() {
    RiotControl.trigger(ActionTypes.loadRss, (store, callback) => {
      axios.get(store.url)
        .then((response) => {
          parser.parseString(response.data, (err, result) => {
            store.items = result.rss.channel[0].item;
            store.items = store.items.map((elem)=> {
              elem.read = false;
              return elem;
            });
            callback(Object.assign({}, store));
          });
        })
        .catch((error) => {
          // console.log(error);
        });
    });
  }

  updateUrl(url) {
    RiotControl.trigger(ActionTypes.updateUrl, (store) => {
      store.url = url;
      return Object.assign({}, store);
    });
  }

  selectFeed(id){
    RiotControl.trigger(ActionTypes.selectFeed, (store)=> {
      store.currentId = id;
      store.items[id].read = true;
      return Object.assign({}, store);
    });
  }
}

export default RssAction;
