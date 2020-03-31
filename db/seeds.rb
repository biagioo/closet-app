b = User.create(username: "biagioo", email: "b@test.com", password: "pass")
Item.create(clothing_type: 'Jeans', brand: 'Empirer', size: 'Medium', user: b)
Item.create(clothing_type: 'Sweater', brand: 'Supreme', size: 'Medium')