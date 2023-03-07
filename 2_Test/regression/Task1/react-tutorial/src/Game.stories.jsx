import React from "react";
import { action } from "@storybook/addon-actions";
import { Game } from "./game";

export default {
  title: "Game",
  component: Game,
};

const Template = (args) => <Game />;

export const Default = Template.bind({});
