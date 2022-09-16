import { Controller } from "@hotwired/stimulus"

const apiKey = 'e6caf363437a9a502062a3a6f4a68627';
// const apiKey = TMBD_KEY;
// Connects to data-controller="search-movies"
export default class extends Controller {
  static targets = ['list', 'query']

  connect() {
    console.log('Hello Search')
    console.log(this.listTarget)
    console.log(process.env)
  }

  search(event) {
    event.preventDefault()
    const query = this.queryTarget.value
    fetch(`https://api.themoviedb.org/3/search/movie?api_key=${apiKey}&language=en-US&query=${query}&page=1&include_adult=false`)
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      })
  }
}
