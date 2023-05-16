defmodule JinWeb.CoreComponents do
  @moduledoc """
  Provides core UI components.

  The default components use Tailwind CSS, a utility-first CSS framework.
  See the [Tailwind CSS documentation](https://tailwindcss.com) to learn
  how to customize them or feel free to swap in another framework altogether.
  """

  alias JinWeb.Components.Core.Back
  alias JinWeb.Components.Core.Flash
  alias JinWeb.Components.Core.Form
  alias JinWeb.Components.Core.Header
  alias JinWeb.Components.Core.Icon
  alias JinWeb.Components.Core.JSCommands
  alias JinWeb.Components.Core.List
  alias JinWeb.Components.Core.Modal
  alias JinWeb.Components.Core.Table
  alias JinWeb.Components.Core.Form.Button
  alias JinWeb.Components.Core.Form.Error
  alias JinWeb.Components.Core.Form.Input
  alias JinWeb.Components.Core.Form.Label

  defdelegate modal(assigns), to: Modal
  defdelegate flash(assigns), to: Flash
  defdelegate flash_group(assigns), to: Flash
  defdelegate back(assigns), to: Back
  defdelegate simple_form(assigns), to: Form
  defdelegate button(assigns), to: Button
  defdelegate error(assigns), to: Error
  defdelegate input(assigns), to: Input
  defdelegate label(assigns), to: Label
  defdelegate header(assigns), to: Header
  defdelegate table(assigns), to: Table
  defdelegate list(assigns), to: List
  defdelegate icon(assigns), to: Icon
  defdelegate hide(js, selector), to: JSCommands
  defdelegate show(js, selector), to: JSCommands
  defdelegate show_modal(js, id), to: Modal
  defdelegate hide_modal(js, id), to: Modal
  defdelegate translate_error(error), to: Error
  defdelegate translate_errors(errors, field), to: Error
end
