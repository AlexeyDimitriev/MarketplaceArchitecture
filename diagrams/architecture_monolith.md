```mermaid
graph TD
    %% Actors
    Customer
    Seller

    %% Services
    subgraph Marketplace ["Marketplace"]
        APIGateway
        MarketplaceService
        MarketplaceDB
    end

    %%Relations
    Customer --> APIGateway
    Seller --> APIGateway
    APIGateway --> MarketplaceService
    MarketplaceService --> MarketplaceDB
```