import React from "react";

export default function Button({ label, backgroundColor, size }) {
  return (
    <button
      type="button"
      className={["button", `button--${size}`].join(" ")}
      style={{ backgroundColor }}
    >
      {label}
    </button>
  );
}
