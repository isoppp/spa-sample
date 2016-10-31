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

  <style scoped type="scss">
    .title {
      border-left: 5px solid #222;
      font-size: 18px;
      font-weight: bold;
      line-height: 1.3;
      margin-bottom: 30px;
      padding-left: 10px;
      word-break: break-all;
    }

    .detail {
      line-height: 1.4;
      margin-bottom: 30px;
      word-break: break-all;
    }

    .link {
      border: 1px solid #222;
      color: #222;
      cursor: pointer;
      display: block;
      height: 40px;
      line-height: 40px;
      margin: 0 auto 20px;
      max-width: 100%;
      text-align: center;
      transition: all .2s;
      width: 320px;

      &:hover {
        background: #222;
        color: #FFF;
        text-decoration: none;
        transition: all .2s;
      }
    }

    @media screen and (max-width: 768px) {
      .title,
      .detail {
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
