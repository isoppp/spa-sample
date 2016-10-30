import RiotControl  from "riotcontrol"
import RssStore from "../stores/rssStore";
import RssAction  from "../action/rssAction"


<rss-list>
  <ul>
    <li class="card" onclick={click} each={ item, index in items } data-rssid={index}>
      <div class="title">{ item.title }</div>
      <div class="description">{ item.description }</div>
    </li>
  </ul>

  <script>
    const rssAction = new RssAction();

    this.on('mount', () => {
      this.items = RssStore.store.items;
      this.update();
    });

    this.click = (event) => {
      event.preventDefault();
      rssAction.selectFeed(event.currentTarget.dataset.rssid)
      riot.route('detail');
    };

  </script>

  <style scoped>
    .card {
      position: relative;
      display: block;
      margin-bottom: 12px;
      border: 1px solid #aaa;
      padding: 16px;
      transition: all .1s;
    }

    .card:hover {
      cursor: pointer;
      border: 1px solid #E1690D;
      transition: all .1s;
      margin-left: 20px;
    }

    .title, .description {
      white-space: nowrap;
      width: 100%;
      overflow: hidden;
      text-overflow: ellipsis;
    }

    .title {
      font-weight: bold;
      font-size: 18px;
      margin-bottom: 10px;
      color: #444;
    }

    .description {
      font-size: 14px;
      color: #888;
    }

    @media screen and (max-width: 768px) {
      .title {
        font-size: 14px;
        margin-bottom: 6px;
      }

      .description {
        font-size: 12px;
      }

      .card {
        padding: 12px;
      }

      .card:hover {
        margin-left: 0;
      }
    }
  </style>
</rss-list>
