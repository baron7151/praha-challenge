import React from "react";

import Button from "./Button";

export default {
  component: "component/atom/Button",
  title: "Buton",
};

const Template = (args) => <Button {...args} />;

export const Default = Template.bind({});
Default.args = {
  label: "Button",
  size: "medium",
  backgroundColor: "brown",
};
