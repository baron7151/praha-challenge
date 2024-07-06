import React from "react";
import styles from "./Link.module.css";
export default function Link({ label, color, href }) {
  return (
    <a className={styles.navLink} style={{ color }} href={{ href }}>
      {label}
    </a>
  );
}
