$( document ).on('turbolinks:load', function() {

  var search_list = $(".contents");

  function appendArtist(artist) {
    var html = `
              <div class="card-deck col-6">
                <a href="/artists/${artist.id}">
                  <div class="card">
                    <img class="card-img-top">
                    <img class="img" src="${artist.image.url}">
                    <h4 class="card-title text-center mb-4">
                      ${artist.name}
                    </h4>
                  </div>
                </a>
              </div>
              `
    search_list.append(html);
}

  function appendErrMsgToHTML(msg) {
    var html = `
              <div class="artist_content">
              <p class="artist_name">
              ${ msg }
              </p>
              </div>
              `
    search_list.append(html);
  }

  $(".search_input").on("keyup", function() {
    var input = $(".search_input").val();
    $.ajax({
      type: 'GET',
      url: '/artists/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(artist) {
      $(".contents").empty();
      if (artist.length !== 0) {
        artist.forEach(function(artist){
          appendArtist(artist);
        });
      } else {
        appendErrMsgToHTML("一致するアーティストはいません");
      }
    })
    .fail(function() {
      alert('error');
    });
  });
});