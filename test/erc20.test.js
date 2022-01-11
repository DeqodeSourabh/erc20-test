const BigNumber = require('big-number');
const erc20 = artifacts.require("erc20");

require('chai')
    .use(require('chai-bignumber')(BigNumber))
    .should();
contract('erc20', accounts =>{
    const _name = "My Token";
    const _symbol = "MYT";
    const _decimal = 18;
    const initialBal = 1000;
    const amount = 20;
    const [ initialHolder, recipient, anotherAccount ] = accounts;
    beforeEach(async function(){
        this.token = await erc20.new(_name, _symbol, _decimal);
    });
    describe('token attributes', function(){
        it('has the correct name', async function(){
            const name = await this.token.name1();
            name.should.equal(_name);
        });
        it('has the correct symbol', async function(){
            const symbol = await this.token.symbol1();
            symbol.should.equal(_symbol);
        });

        it('has the correct decimal', async function(){
            const decimal = await this.token.decimal1();
            decimal.should.be.bignumber.equal(_decimal);
        });
    });

    describe('Function of Erc20',function(accounts){
        it('has the balance',async function(){
            const balance = await this.token.balanceOf();
            balance.should.equal(initialBal);

        })
        it('should total Supply',function(){
            const totalSupply = await this.token.totalSupply();
            totalSupply.should.equal(totalSupply);
        })
        describe('Other Function', function(){
            it('Transfer Function ',async function(){
                const boolean = await this.token.transfer(account[1],amount)
                boolean.should.equal('true');
            })
            it('Approve Function  ',async function(){
                const boolean_result = await this.token.approve(account[2],amount)
                boolean_result.should.equal('true');
            })
            it('transferFrom Function', async function(){
                const boolean = await this.token.trasferFrom(account[0],account[1],amount)
                booleanResult.should.equal('true');
            })
        })


    });
});
