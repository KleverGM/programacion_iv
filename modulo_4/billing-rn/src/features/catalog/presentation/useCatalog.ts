import { useEffect, useMemo, useState } from "react";
import { catalogRepositoryImpl } from "../data/catalogRepositoryImpl";
import type { Category, Product } from "../domain/entities";
import type { ListProductsParams } from "../domain/repositories";

export function useCatalog() {
  const [loading, setLoading] = useState(true);
  const [categories, setCategories] = useState<Category[]>([]);
  const [products, setProducts] = useState<Product[]>([]);
  const [count, setCount] = useState(0);
  const [error, setError] = useState("");

  // Estado de paginación y filtros
  const [params, setParams] = useState<ListProductsParams>({
    page: 1,
    page_size: 10,
    ordering: "-created_at",
  });

  const [selectedCategory, setSelectedCategory] = useState<number | null>(null);

  const loadData = async () => {
    setLoading(true);
    setError("");
    try {
      const [cats, prods] = await Promise.all([
        catalogRepositoryImpl.listCategories(),
        catalogRepositoryImpl.listProducts(params),
      ]);
      setCategories(cats);
      setProducts(prods.results);
      setCount(prods.count);
    } catch (e) {
      setError("No se pudo cargar el catálogo.");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    loadData();
  }, [params]);

  const setCategory = (categoryId: number | null) => {
    setSelectedCategory(categoryId);
    setParams((prev) => ({
      ...prev,
      category: categoryId ?? undefined,
      page: 1,
    }));
  };

  const nextPage = () => {
    setParams((prev) => ({ ...prev, page: (prev.page ?? 1) + 1 }));
  };

  const prevPage = () => {
    setParams((prev) => ({ ...prev, page: Math.max(1, (prev.page ?? 1) - 1) }));
  };

  const refresh = () => {
    loadData();
  };

  return useMemo(
    () => ({
      loading,
      error,
      categories,
      products,
      count,
      selectedCategory,
      setCategory,
      nextPage,
      prevPage,
      params,
      refresh,
      reloadAll: loadData,

      // ====== Métodos CRUD (para admin) ======
      createCategory: (payload: { name: string; slug?: string | null }) =>
        catalogRepositoryImpl.createCategory(payload),

      updateCategory: (
        id: number,
        payload: { name: string; slug?: string | null },
      ) => catalogRepositoryImpl.updateCategory(id, payload),

      deleteCategory: (id: number) => catalogRepositoryImpl.deleteCategory(id),

      createProduct: (payload: any) =>
        catalogRepositoryImpl.createProduct(payload),
      updateProduct: (id: number, payload: any) =>
        catalogRepositoryImpl.updateProduct(id, payload),
      deleteProduct: (id: number) => catalogRepositoryImpl.deleteProduct(id),
    }),
    [loading, error, categories, products, count, selectedCategory, params],
  );
}
