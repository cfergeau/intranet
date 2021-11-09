import { Link } from "react-router-dom"
import { RouteConfig, renderRoutes } from "react-router-config"
import { Helmet } from "react-helmet"
import { ToastContainer } from "react-toastify"

import logo from "../static/logo.svg"
import config from "../config"
// Import your global styles here
import "normalize.css/normalize.css"
import styles from "./styles.module.scss"
import "react-toastify/dist/ReactToastify.css"

interface Route {
    route: { routes: RouteConfig[] }
}

const App = ({ route }: Route): JSX.Element => (
    <div className={styles.App}>
        <Helmet {...config.APP} />
        <Link to="/" className={styles.header}>
            <img src={logo} alt="Logo" role="presentation" />
            <h1>
                <em>{config.APP.title}</em>
            </h1>
        </Link>
        <hr />
        {/* Child routes won't render without this */}
        {renderRoutes(route.routes)}
        <ToastContainer />
    </div>
)

export default App
