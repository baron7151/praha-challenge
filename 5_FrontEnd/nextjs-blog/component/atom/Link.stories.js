import React from "react";

import Link from "./Link";

export default {
  component: "component/atom/Link",
  title: "Link",
};

const Template = (args) => <Link {...args} />;

export const Default = Template.bind({});
Default.args = {
  label: "Link",
  color: "White",
  href: "",
};

export const Gray = Template.bind({});
Gray.args = {
  label: "Link",
  color: "rgba(255,255,255,.5)",
  href: "",
};
