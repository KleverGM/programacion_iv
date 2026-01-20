import type {
  CatalogRepository,
  ListProductsParams,
} from "../domain/repositories";
import type { Paginated, Product, Category } from "../domain/entities";
import {
  catalogApi,
  CategoryPayload,
  ProductPayload,
} from "./catalogApiDataSource";

export const catalogRepositoryImpl: CatalogRepository & {
  createCategory: (payload: CategoryPayload) => Promise<Category>;
  updateCategory: (id: number, payload: CategoryPayload) => Promise<Category>;
  deleteCategory: (id: number) => Promise<void>;

  createProduct: (payload: ProductPayload) => Promise<Product>;
  updateProduct: (id: number, payload: ProductPayload) => Promise<Product>;
  deleteProduct: (id: number) => Promise<void>;
} = {
  listCategories: () => catalogApi.listCategories(),
  listProducts: (params?: ListProductsParams): Promise<Paginated<Product>> =>
    catalogApi.listProducts(params),

  createCategory: (payload: CategoryPayload) =>
    catalogApi.createCategory(payload),
  updateCategory: (id: number, payload: CategoryPayload) =>
    catalogApi.updateCategory(id, payload),
  deleteCategory: (id: number) => catalogApi.deleteCategory(id),

  createProduct: (payload: ProductPayload) => catalogApi.createProduct(payload),
  updateProduct: (id: number, payload: ProductPayload) =>
    catalogApi.updateProduct(id, payload),
  deleteProduct: (id: number) => catalogApi.deleteProduct(id),
};
