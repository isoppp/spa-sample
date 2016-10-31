<header>
  <div class="header">
    <div class="container">
      <h1 onclick={goHome} class="title">Riot SPA Sample -RSS Reader-</h1>
    </div>
  </div>

  <script>
    this.goHome = (event) => {
      riot.route('home');
    }
  </script>
  <style scoped>
    .header {
      background: #444;
      color: #FAFAFA;
      display: block;
      height: 48px;
      width: 100%;
    }

    .title {
      font-size: 16px;
      line-height: 48px;
      text-align: center;
    }
  </style>
</header>
