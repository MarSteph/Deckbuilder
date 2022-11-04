"""empty message

Revision ID: 1b436c7f7800
Revises: c4847d163b01
Create Date: 2022-09-29 22:10:48.409620

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '1b436c7f7800'
down_revision = 'c4847d163b01'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('sets',
    sa.Column('id', sa.Integer(), autoincrement=True, nullable=False),
    sa.Column('name', sa.Text(), nullable=False),
    sa.PrimaryKeyConstraint('id'),
    sa.UniqueConstraint('name')
    )
    op.add_column('cards', sa.Column('set_id', sa.Integer(), nullable=False))
    op.create_foreign_key(None, 'cards', 'sets', ['set_id'], ['id'])
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_constraint(None, 'cards', type_='foreignkey')
    op.drop_column('cards', 'set_id')
    op.drop_table('sets')
    # ### end Alembic commands ###
