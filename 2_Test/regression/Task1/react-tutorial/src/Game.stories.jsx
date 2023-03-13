import React from "react";
import { action } from "@storybook/addon-actions";
import { Game } from "./game";

export default {
  title: "Game",
  component: Game,
};

const Template = (args) => <Game {...args} />;

export const Default = Template.bind({});

Default.args = {
  current: { squares: Array(9).fill(null) },
  onClick: action("clicked"),
  moves: [],
  status: "次のプレイヤー: X",
};

export const Xwin = Template.bind({});

Xwin.args = {
  current: { squares: Array(9).fill("X") },
  onClick: action("clicked"),
  moves: [],
  status: "Winner: X",
};

export const Draw = Template.bind({});

Draw.args = {
  current: { squares: ["X", "O", "X", "X", "O", "X", "O", "X", "O"] },
  onClick: action("clicked"),
  moves: [],
  status: "Draw!",
};
