import RssStore from "../stores/rssStore";
import RssAction  from "../action/rssAction"


<rss-list>
  <ul>
    <li onclick={click} each={ item, index in items } data-rssid={index} class={card: true, is-read: item.read}>
      <div class="title">{ item.title }</div>
      <div class="description">{ item.description }</div>
    </li>
  </ul>

  <script>
    const rssAction = new RssAction();

    this.on('mount', () => {
      if(!RssStore.store.items.length) riot.route('home');
      this.items = RssStore.store.items;
      this.update();
    });

    this.click = (event) => {
      event.preventDefault();
      rssAction.selectFeed(event.currentTarget.dataset.rssid)
      riot.route('detail');
    };

  </script>

  <style scoped type="scss">
    .card {
      border: 1px solid #FB8;
      display: block;
      margin-bottom: 12px;
      padding: 16px;
      position: relative;
      transition: all .1s;

      &:hover {
        border: 1px solid #E1690D;
        border-left: 8px solid #E1690D;
        cursor: pointer;
        margin-left: 20px;
        transition: all .1s;
      }

      &.is-read {
        border: 1px solid #CCC;
        opacity: .6;

        &:hover {
          border: 1px solid #FDA;
        }
      }
    }

    .title,
    .description {
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
      width: 100%;
    }

    .title {
      color: #444;
      font-size: 18px;
      font-weight: bold;
      margin-bottom: 10px;
    }

    .description {
      color: #888;
      font-size: 14px;
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

        &:hover {
          margin-left: 0;
        }
      }
    }

  </style>
</rss-list>
