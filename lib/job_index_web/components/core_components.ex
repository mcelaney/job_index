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
  alias JinWeb.Components.Core.Form.Button
  alias JinWeb.Components.Core.Form.Error
  alias JinWeb.Components.Core.Form.Input
  alias JinWeb.Components.Core.Form.Label
  alias JinWeb.Components.Core.Header
  alias JinWeb.Components.Core.Icon
  alias JinWeb.Components.Core.JSCommands
  alias JinWeb.Components.Core.List
  alias JinWeb.Components.Core.Modal
  alias JinWeb.Components.Core.Table

  defdelegate back(assigns), to: Back
  defdelegate button(assigns), to: Button
  defdelegate error(assigns), to: Error
  defdelegate flash(assigns), to: Flash
  defdelegate flash_group(assigns), to: Flash
  defdelegate header(assigns), to: Header
  defdelegate hide(js, selector), to: JSCommands
  defdelegate hide_modal(js, id), to: Modal
  defdelegate icon(assigns), to: Icon
  defdelegate input(assigns), to: Input
  defdelegate label(assigns), to: Label
  defdelegate list(assigns), to: List
  defdelegate modal(assigns), to: Modal
  defdelegate show(js, selector), to: JSCommands
  defdelegate show_modal(js, id), to: Modal
  defdelegate simple_form(assigns), to: Form
  defdelegate table(assigns), to: Table
  defdelegate translate_error(error), to: Error
  defdelegate translate_errors(errors, field), to: Error
end
