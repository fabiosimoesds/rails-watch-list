import { Controller } from "@hotwired/stimulus"

const apiKey = 'e6caf363437a9a502062a3a6f4a68&627&';
// const apiKey = TMBD_KEY;
// Connects to data-controller="search-movies"
export default class extends Controller {
  static targets = ['list', 'query']

  connect() {
    console.log('Hello Search')
    console.log(this.listTarget)
  }

  search(event) {
    event.preventDefault()
    this.listTarget.innerHTML = ""
    const query = this.queryTarget.value
    fetch(`https://api.themoviedb.org/3/search/movie?api_key=${apiKey}&language=en-US&query=${query}&page=1&include_adult=false`)
      .then(response => response.json())
      .then((data) => {
        data.results.forEach(film => {
          const card = `<div class="col g-3">
                          <div class="card" style="width: 18rem;">
                            <img src="https://image.tmdb.org/t/p/w600_and_h900_bestv2/${film.poster_path}" class="card-img-top" alt="...">
                            <div class="card-body">
                              <h5 class="card-title film-title">${film.original_title}</h5>
                              <p class="card-text">${film.vote_average}/10<i class="fa-solid fa-star text-warning"></i></p>
                              <p class="card-text film-overview">${film.overview}</p>
                            </div>
                          </div>
                        </div>`;
          this.listTarget.insertAdjacentHTML("beforeend", card);
        });
      })
  }
}
