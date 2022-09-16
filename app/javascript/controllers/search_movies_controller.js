import { Controller } from "@hotwired/stimulus"

const apiKey = "TMBD_KEY";
// Connects to data-controller="search-movies"
export default class extends Controller {
  static targets = ['list', 'query']

  connect() {
    console.log('Hello Search')
    console.log(this.listTarget)
  }

  search(event) {
    event.preventDefault()
    console.log(this.queryTarget.value)
    const query = this.queryTarget.value
    console.log(apiKey)
    // fetch(`https://api.themoviedb.org/3/search/movie?api_key=${TMBD_KEY}&language=en-US&query=${query}&page=1&include_adult=false`)
  }
}
