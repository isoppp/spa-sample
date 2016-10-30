import RiotControl from 'riotcontrol'
import ActionTypes from '../actionTypes';

const store = new class RssStore {
  constructor(){
    riot.observable(this);
    this.actionType = {
      loaded : "rss_loaded"
    };

    this.store = {};
    this.store.url = 'https://moo-infobeads.ssl-lolipop.jp/sample.xml';
    this.store.items = [];
    this.currentId = 0;
    this.on(ActionTypes.loadRss, this._loadRss.bind(this));
    this.on(ActionTypes.updateUrl, this._updateUrl.bind(this));
    this.on(ActionTypes.selectFeed, this._selectFeed.bind(this));
  }

  _loadRss(action) {
    action(this.store,(store)=>{
      this.store = store;
      RiotControl.trigger(this.actionType.loaded);
    });
  }

  _updateUrl(action){
    this.store = action(this.store);
  }

  _selectFeed(action){
    this.store = action(this.store);
  }
};
RiotControl.addStore(store);
export default store;
