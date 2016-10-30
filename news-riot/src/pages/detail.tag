import '../components/header.tag';
import '../components/footer.tag';
import '../components/pagetitle.tag';
import '../components/rss-detail.tag';

<detail>
  <header></header>

  <div class="container main">
    <article class="article">

      <pagetitle title="RSS Detail"></pagetitle>
      <rss-detail></rss-detail>

      <a href="#" onclick={back}>戻る</a>
    </article>
  </div>

  <footer></footer>

  <script>
    this.back = (e)=>{
      e.preventDefault();
      history.back();
    }
  </script>
</detail>
