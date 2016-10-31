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
      display: block;
      width: 100%;
      background: #444;
      color: #fafafa;
      height: 48px;
    }

    .title {
      font-size: 16px;
      line-height: 48px;
      text-align: center;
    }
  </style>
</header>
