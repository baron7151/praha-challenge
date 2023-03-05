import React from "react";
import { action } from "@storybook/addon-actions";
import { Square } from "./game";

export default {
  title: "Square",
  component: Square,
};

const Template = (args) => <Square {...args} />;

export const Default = Template.bind({});
Default.args = {
  value: null,
  onClick: action("clicked"),
};

export const xClicked = Template.bind({});
xClicked.args = {
  value: "X",
  onClick: action("clicked"),
};

export const oClicked = Template.bind({});
oClicked.args = {
  value: "O",
  onClick: action("clicked"),
};

export const triangleClicked = Template.bind({});
triangleClicked.args = {
  value: "△",
  onClick: action("clicked"),
};
