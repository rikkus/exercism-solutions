defmodule BankAccount do
  @moduledoc """
  A bank account that supports access from multiple processes.
  """

  @typedoc """
  An account handle.
  """
  @opaque account :: pid

  @doc """
  Open the bank. Makes the account available.
  """
  @spec open_bank() :: account
  def open_bank() do
    {:ok, agent} = Agent.start_link fn -> 0 end
    agent
  end

  @doc """
  Close the bank. Makes the account unavailable.
  """
  @spec close_bank(account) :: any
  def close_bank(account) do
    Agent.cast account, fn _ -> :closed end
  end

  @doc """
  Get the account's balance.
  """
  @spec balance(account) :: integer | {:error, atom}
  def balance(account) do
     case Agent.get account, fn balance -> balance end do
      :closed -> {:error, :account_closed}
      balance -> balance
     end
  end

  @doc """
  Update the account's balance by adding the given amount which may be negative.
  """
  @spec update(account, integer) :: integer | {:error, atom}
  def update(account, amount) do
     Agent.get_and_update account, fn balance ->
      case balance do
        :closed -> {{:error, :account_closed}, :closed}
        balance -> {balance + amount, balance + amount}
      end
    end
  end

end
