#--------------------------------- Requires --------------------------------
process.stdout.write 'Loading modules...'
http =             require 'http'
express =          require 'express.io'
stylus =           require 'stylus'
nib =              require 'nib'
fs =               require 'fs'
coffeescript =     require 'coffee-script'
connect_assets =   require 'connect-assets'
jade_assets =      require 'connect-assets-jade'
console.log 'done.'

APP_PORT = 8080

app = express()
app.http()
app.listen APP_PORT

app.configure ->
  #google_auth('localhost')

  app.use express.cookieParser()
  app.use express.bodyParser()
  app.use express.methodOverride()

  app.set 'view engine', 'jade'
  app.set 'views', __dirname + '/assets'

  app.use connect_assets
    jsCompilers:
      jade: jade_assets()

  app.use app.router
  app.use express.logger()

  app.get "/", (req, res) ->
    res.render 'index'

  console.log "Server started, listening on port #{APP_PORT}"
  console.log ''
