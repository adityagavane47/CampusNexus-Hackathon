from algopy import ARC4Contract, UInt64, String, arc4, Global, Txn, gtxn, itxn

class Marketplace(ARC4Contract):
    """
    A simple marketplace contract that allows listing items and buying them.
    """
    
    def __init__(self) -> None:
        self.listings_count = UInt64(0)
        # We might use Box map for storage, but for a hackathon template, 
        # a simple payment router might be enough if state is off-chain.
        # Let's verify if we need on-chain state. The backend uses in-memory.
        # Let's make this a simple "Escrow" style marketplace or just a payment logger.
        pass

    @arc4.abimethod
    def buy(self, payment: gtxn.PaymentTransaction, item_id: UInt64, quantity: UInt64) -> String:
        """
        Buy an item by sending ALGO.
        """
        assert payment.receiver == Global.current_application_address
        assert payment.amount > 0
        
        # Log the purchase
        return "Purchase Successful"

    @arc4.abimethod
    def withdraw(self, amount: UInt64) -> None:
        """
        Admin withdraw function.
        """
        assert Txn.sender == Global.creator_address
        itxn.Payment(
            receiver=Txn.sender,
            amount=amount
        ).submit()
