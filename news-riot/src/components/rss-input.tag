import RiotControl  from "riotcontrol"
import RssStore from "../stores/rssStore";
import RssAction  from "../action/rssAction"

<rss-input>
  <input type="text" onkeyup={keyup} placeholder="please enter rss url">
  <button onclick={submit} type="submit" class="submit">
    <div class="text">Go!</div>
    <img class="loading is-hidden" src="data:image/gif;base64,R0lGODlhGwAbALMAAP///9XV1dHR0c/Pz83NzZmZmWZmZjIyMgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH/C05FVFNDQVBFMi4wAwEAAAAh+QQFBwAJACwCAAIAFwAXAAAEcjDJSZGlOGOLtD7bRQXfAU7cGJCU6aJiss6Ya0qpPLO1naQ7XsanWnkmt4zxyDwanlDDUUCtCqLQqZWKfWq3zXCmUNAMBk0yGXM+H9VrgjzRdo/hEjlBUkdT4GV5c3x1GGoUehRtGoETiYpiCY+RiIMeEQAh+QQFBwAJACwCAAIAFQAVAAAETTDJSY+lOE97NDYYhyGfAW7XhKyT6aKdtM6te4rJzFI2KOqkjG1E85g0O48yU2g6C0vK0xmdTJvVrFZCIGwn3e43LNaSvWbyNxFec78RACH5BAUHAAkALAIAAgAXABUAAARWMMlJjaU4Y2u0LttFHV8BTtx4kJTpomKyzphrSqk8s7WdpDtexqdaeSa3jPHIPBKeUMIRQa0iotCplYp9arfNsFgSCIwz5fKZklavye03PC1P0Ot2SgQAIfkEBQcACQAsBAACABUAFQAABEwwySmLpThPWzQmGIcZHwFu12Ssk+minbTOrXuKycxSNijqpIxtRPOYNDuPcslMHJ7QQ1MShU6dVel1S0EguBKvFywec8vfc5lsJlMiACH5BAUHAAkALAwAAgANABcAAARFkMhEq5XE6oR1uVNVjFVHjShloqQ6sd+WsLIY1/hm7Lyh97sfMFc7HHJGowbBTCSVFSaC8jxSpJXqtZmFJrAW63aKA9ciACH5BAUHAAkALAQABAAVABUAAARLMMlJayI2W8K156C3gZhIkaU5kerYvm8hz0VMy/YNiwiSGQZPr1cBAjND4mGZMB4pSV9ieZA4g5LohDq5ToYUbvf5rYi7qjNMbYkAACH5BAUHAAkALAIADAAXAA0AAARAEMmJkr2X6E3oxCC3eRKIiZqprutxqEXBWq4LxjFb20af4DnT7pXoGSxAGWZ4MV6SoBrG+QxGQdTnbOrbrrKqCAAh+QQJBwAJACwCAAIAFwAXAAAETzDJSau9OFekO/od9o3hNYLldqYqyk7uK0tHbR/vbec6Pv8Xg+FCIHSEwkqxmEEmC9DEkmlxDhPQgmRqpFgn2Qm3gqSExVRy5SxOsWVvSwQAOw==">
  </button>


  <script>
    const rssAction = new RssAction();

    this.keyup = (e) => {
      rssAction.updateUrl('https://moo-infobeads.ssl-lolipop.jp/sample.xml'); //dummy
      e.currentTarget.classList.toggle('is-valid', e.currentTarget.value);
    }

    this.submit = (event) => {
      event.preventDefault();
      rssAction.loadRss();
      event.currentTarget.classList.add('is-loading');
      event.currentTarget.querySelectorAll('.text')[0].classList.add('is-hidden');
      event.currentTarget.querySelectorAll('.loading')[0].classList.remove('is-hidden');
    };

    RiotControl.one(RssStore.actionType.loaded, () => riot.route('list'));
  </script>

  <style scoped type="scss">
    input {
      background: #FDD;
      border: 1px solid #DDD;
      display: block;
      font-size: 16px;
      height: 60px;
      margin: 0 auto 20px;
      max-width: 90%;
      padding: 10px;
      width: 480px;

      &:focus {
        background: #FFF;
        border: 2px solid #AAA;
        outline: none;
      }

      &.is-valid {
        background: #FFF;
      }
    }

    button {
      background: transparent;
      border: 2px solid #E1690D;
      color: #E1690D;
      cursor: pointer;
      display: block;
      font-size: 14px;
      height: 30px;
      margin: 0 auto;
      max-width: 90%;
      transition: all .2s;
      width: 320px;

      &:hover {
        background: #E1690D;
        color: #EEE;
        transition: all .2s;
      }

      &:focus {
        background: #FFF;
        outline: none;
      }

      &.is-loading {
        border: none;
      }
    }

    .text {
      &.is-hidden {
        display: none;
      }
    }

    .loading {
      height: 15px;
      line-height: 30px;
      width: 15px;

      &.is-hidden {
        display: none;
      }
    }
  </style>
</rss-input>
