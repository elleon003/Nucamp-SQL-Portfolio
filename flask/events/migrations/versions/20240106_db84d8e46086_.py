"""empty message

Revision ID: db84d8e46086
Revises: f3478e8702f2
Create Date: 2024-01-06 22:48:55.756534

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'db84d8e46086'
down_revision = 'f3478e8702f2'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('presenters',
    sa.Column('presenter_id', sa.Integer(), autoincrement=True, nullable=False),
    sa.Column('name', sa.String(length=128), nullable=False),
    sa.Column('email', sa.String(length=128), nullable=False),
    sa.PrimaryKeyConstraint('presenter_id')
    )
    op.create_table('ticket_orders',
    sa.Column('order_id', sa.Integer(), autoincrement=True, nullable=False),
    sa.Column('total', sa.Float(), nullable=False),
    sa.Column('date_reserved', sa.DateTime(), nullable=False),
    sa.PrimaryKeyConstraint('order_id')
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('ticket_orders')
    op.drop_table('presenters')
    # ### end Alembic commands ###