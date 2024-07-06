import React from "react";
import styles from "./Navbar.module.css";
export default function Navbar(props) {
  return (
    <nav className={styles.naBbar}>
      <ul>{props.children}</ul>
    </nav>
  );
}
