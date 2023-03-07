import React from "react";
import { action } from "@storybook/addon-actions";
import { Board } from "./game";

export default {
  title: "Board",
  component: Board,
};

const Template = (args) => <Board {...args} />;

export const Default = Template.bind({});
Default.args = {
  squares: Array(9).fill(null),
  onClick: action("clicked"),
};

export const xClicked = Template.bind({});
xClicked.args = {
  squares: Array(9).fill("X"),
  onClick: action("clicked"),
};

export const oClicked = Template.bind({});
oClicked.args = {
  squares: Array(9).fill("O"),
  onClick: action("clicked"),
};

export const triangleClicked = Template.bind({});
triangleClicked.args = {
  squares: Array(9).fill("△"),
  onClick: action("clicked"),
};
