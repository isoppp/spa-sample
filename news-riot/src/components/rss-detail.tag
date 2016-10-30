import RiotControl  from "riotcontrol"
import RssStore from "../stores/rssStore";
import RssAction  from "../action/rssAction"


<rss-detail>

  <h3 class="title">{item.title}</h3>
  <div class="detail">{item.description}</div>
  <a href="{item.link[0]}" target="_blank" class="link">SHOW ORIGINAL</a>

  <script>
    const rssAction = new RssAction();

    this.on('mount', () => {
      if(!RssStore.store.items.length) riot.route('home');
      this.item = RssStore.store.items[RssStore.store.currentId];
      this.update();
    });

  </script>

  <style scoped>
    .title {
      font-size: 18px;
      margin-bottom: 30px;
      border-left: 5px solid #222;
      padding-left: 10px;
      font-weight: bold;
      word-break: break-all;
      line-height: 1.3;
    }

    .detail {
      line-height: 1.4;
      margin-bottom: 30px;
      word-break: break-all;
    }

    .link {
      display: block;
      width: 320px;
      max-width: 100%;
      border: 1px solid #222;
      transition: all .2s;
      height: 40px;
      line-height: 40px;
      text-align: center;
      margin: 0 auto 20px;
      color: #222;
      cursor: pointer;
    }

    .link:hover {
      color: #fff;
      background: #222;
      transition: all .2s;
      text-decoration: none;
    }

    @media screen and (max-width: 768px) {
      .title, .detail {
        margin-bottom: 16px;
      }

      .title {
        border-left: none;
        padding-left: 0;
      }

      .detail {
        line-height: 1.6;
      }
    }
  </style>
</rss-detail>
