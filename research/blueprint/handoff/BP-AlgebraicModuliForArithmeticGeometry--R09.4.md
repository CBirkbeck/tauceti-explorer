# Handoff: BP-AlgebraicModuliForArithmeticGeometry--R09.4

Issue #6336. Agent **Codex**, session **codex-VcuOLj**. This is a complete target-level planning pass, not a checkpoint and not a claim of formal implementation. The packet has `status: complete`; its sole stage **AlgebraicModuliForArithmeticGeometry:R09.4** has coverage **planned**, not closed.

## Delivered and checked

The packet, reader and suggested file agree on **33 nodes: 10 constructions, 3 definitions, 20 theorems; 68 API items; 40 definition/construction tests; 10 pinned baseline declarations; 12 gaps; 20 exact supplier requests**. All implementation statuses remain unchecked. The new planet is **Polarized abelian moduli**. The accepted A0-extension already gives R09.4 five gerbe planets, so the unsplit layer has six in total.

The target chains include an integral one-gon Weierstrass theorem before the auxiliary B_n presentation, avoiding a hidden circular n=1 proof. They specify fixed-polygon groupoids, fpqc descent, the exact range and flatness of the cyclic cover, algebraicity, finite diagonal, properness, the exact DM locus and cusp tameness. The abelian branch specifies the native relative carrier and field adapters, relative duals and polarization degree, local representatives, the canonical doubled cubic bundle and its Hilbert polynomial, bounded projective frames, full unrestricted GL level, fine schemes, separated DM moduli and prime-to-degree smoothness. No properness or blanket positive-characteristic tameness is asserted for uncompactified abelian moduli.

Checks:

- `python3 scripts/check_blueprint.py research/blueprint/packets/AlgebraicModuliForArithmeticGeometry--R09.4.json`: **zero errors, zero warnings**.
- `lean-check research/blueprint/suggested/AlgebraicModuliForArithmeticGeometry--R09.4.lean`: **elaborated successfully with only declaration-uses-sorry warnings**, at Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**. Memory availability exceeded 20 GB; no language server or Lake build was run.
- Every node declaration, API name and test name occurs in both the reader and suggested file. Native statements are typed; all unavailable geometric signatures are **explicitly named omissions with exact contracts**. There are no arbitrary proposition fields or substitute stack/curve carriers. G-native records this limitation; elaboration does not validate the omitted geometry.
- Only the three issue deliverables and this handoff are changed. Source excerpts, source files and private absolute paths are absent. Scratch notes and public downloaded sources are removed after the PR opens.

The reviewed R09.4 library audit was read. The current read-only upstream roadmap commit **3b51bbf9a925f23bca922570bea8d641b6ec712d** and Tau Ceti commit **a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039** were inspected. AlgebraicVectorBundles and StableReduction were read in full, with their suggested files; the relevant ModularCurves, EllipticCurves and JacobianChallenge interfaces were also inspected. Existing native field abelian varieties, generic Cat-valued descent and upstream curve/group/quotient machinery are imported rather than replanned. No relevant open Mathlib PR or Zulip proposal for the missing relative carriers was found in the searches recorded during the run.

## Confirmed red-team findings

**RT-AREA-algebraicgeometry/1:** SF.1 is the sole generic space/stack owner. The packet proposes **SF.1 → R09.3** and **SF.1 → R09.4**, narrows R09.3 to Weil restriction, finite-quotient comparison and moduli-object descent, and restricts the new R09.4 nodes to arithmetic applications. Generic stacks, diagonals, fibre products, atlases and their independence are not redeclared. The inherited A0-extension gerbe targets are retained unchanged and cited only under their actual hypotheses; its 16 gaps and 22 requests are not discharged here.

**RT-AREA-algebraicgeometry/17:** The missing stable-pointed moduli owner now exists as **StableReductionPartII**, so the alternative Part II solution is used. Import contracts identify `key/moduli-curves`, `MC.1/finite-unramified-diagonal`, `MC.1/proper-moduli` and `MC.2/pointed-dm-theorem`. That packet’s independent review needs changes. Replace its generic R09.4 references with precise SF.1 interfaces **before** composing supplier edges; otherwise a cycle would arise. Its genus-one argument uses a rigid triangle and does not require this packet’s E_1. The exact pointed finite-unramified diagonal extension, including genus zero and one, is requested from MC.2. R09.5 is requested to construct a **finite surjective scheme cover carrying the pulled-back universal stable family**. SF.4 imports Part II plus that cover. Neither étaleness at wild primes nor a coarse-space universal family is promised.

## Moves required by upstream tiers

The maintainer applies these moves; no other packet was edited.

| Existing higher input | Lower owner in this packet | Higher scope retained |
| --- | --- | --- |
| ModularCurvesPartII:R13.1/semistable-genus-one-curves-and-neron-polygons, polygon part | R09.4/arith-standard-ngon | Bare semistable curves import StableReduction Layer 3 |
| ModularCurvesPartII:R13.1/generalized-elliptic-curve | R09.4/arith-generalized-elliptic | DR structure criterion and richer morphism/level applications |
| ModularCurvesPartII:R13.1/non-smooth-locus-and-base-change | R09.4/arith-degeneracy | Γ-specific deformation/level consequences |
| ModularCurvesPartII:R13.1/contraction-away-from-a-divisor | R09.4/arith-contraction, including general divisor construction and subgroup law | Contraction maps between arithmetic levels |
| Minimum relative abelian carrier, dual/Poincaré and polarization inputs in AbelianSchemes A.1/A.2 | arith-abelian-scheme, arith-relative-dual, arith-polarization | Higher Rosati, type and integral arithmetic theory |
| Minimum full-level rigidity and fine scheme needed for algebraicity | arith-full-level, arith-polarized-automorphism-rigidity, arith-fine-polarized-scheme | Richer arithmetic levels and correspondences in AbelianSchemes A.6; coarse comparisons in R09.5 |
| Minimum polarized Artin lifting prerequisite | arith-polarized-small-extension-lifting | General formal/deformation comparisons in R09.6 |

Add R09.4 → ModularCurvesPartII:R13.1 and the corresponding abelian consumer edges. Import only the lower minimum results into the higher plans. Field abelian varieties remain with Tau Ceti and JacobianChallenge. All proposed ownership changes and exact replacement boundaries are in the packet’s `restructure` and `imports` fields.

## Exact open frontier

No new target-level node remains unwritten. Independent review should verify the contracts and ownership changes, then address these named proof inputs:

1. **G-native:** supply SF.1 and arithmetic geometric carriers so the named omitted signatures can be typed faithfully.
2. **G-cyclic-cover:** reconstruct the pointed cyclic finite étale cover across the one-gon and its generalized action/base change in DR V.1.4.
3. **G-trait-isom:** prove matched-count generalized elliptic isomorphism extension using regular/minimal models, then relative finiteness.
4. **G-trait-model:** prove the prescribed polygon count after extension/ramification and the needed subgroup, including bad characteristics.
5. **G-relative-torsion:** prove finite locally free multiplication and its degree over arbitrary bases from the existing field theorem.
6. **G-dual:** prove arbitrary-base relative dual representability, normalized Poincaré data, base change and biduality.
7. **G-level-rigidity:** prove minimum polarized finite automorphisms and full-level faithfulness, including N=4.
8. **G-framed-locus:** prove the precise bounded Hilbert/Hom group-law and polarization locus represents the framed problem.
9. **G-fine-level:** prove the relative GIT quotient is a quasi-projective scheme with universal family; trivial inertia alone yields only an algebraic space.
10. **G-good-reduction-extension:** prove trait homomorphism extension for abelian schemes and extend inverses/polarization equations.
11. **G-abelian-deformation:** reconstruct the minimal abelian and line-bundle obstruction calculation, separable cup-product surjectivity and tangent dimension.
12. **G-owner-rewiring:** apply the generic/stable/higher arithmetic ownership changes before composing the requested suppliers.

The twenty requests name SF.1, existing ModularCurves inputs, StableReduction Layers 2–5 and 7, JacobianChallenge Layers C/E, R09.1/R09.2/R09.5, StableReductionPartII:MC.2 and SF.4. They state exactly which scheme, descent, stack-property, representability or finite-cover result is needed. They are request records, not messages sent to other workers.

The general positive-divisor contraction proof was reconstructed from **DR IV.1.1–IV.1.3, pp.DeRa63–65**: finite-presentation reduction, base-change-compatible section algebra, uniform finite generation, relative Proj, uniqueness and subgroup transport. It is no longer a source-proof gap; its missing native signatures remain in G-native.

## Sources and corrections

Public source URLs, edition/date, read sections and downloaded-file SHA-256 hashes are recorded in the packet. Citations use author-copy pages or DR’s unambiguous internal DeRa pages. No passage is copied into a deliverable.

Read for the relevant targets:

- Česnavičius, arXiv:1511.07475v2: Definitions 2.1.1/2.1.3/2.1.7 and Lemma 2.1.6, pp.6–7; §3.1, pp.15–19; §3.2.1, pp.19–20. Published §3.2.1, pp.2025–2026 was compared for its contraction wording.
- Conrad, author copy: §2.1 and relevant §2.2, pp.4–10; §3.2, pp.23–26, especially Theorems 3.2.2/3.2.4.
- Deligne–Rapoport: II.2.3–II.2.6, pp.DeRa44–46; III.2.5–III.2.6, pp.DeRa61–62; IV.1.1–IV.1.3, pp.DeRa63–65; IV.1.6, pp.DeRa65–67; V.1.1–V.1.5, pp.DeRa92–94. Read from the public scan’s browser text; dropped displayed formulas are a limitation specifically retained in G-cyclic-cover.
- Olsson survey: §2.1, pp.297–303, including Lemmas 2.1.8/2.1.9 and Theorem 2.1.11.
- Kass’s eight-page notes: definition, Theorem 1 and Artin-local rigidity proof, pp.1–3; dual/fine-level statements in §3, pp.5–7. Omitted proofs are not certified.
- Oort: Lemma 2.3.2, pp.282–284; the separable-polarization lifting implication of Theorem 2.4.1, pp.286–287.
- AOV: Definition 2.6/Proposition 2.7, pp.1067–1068; Definition 3.1/Theorem 3.2/Corollary 3.3, pp.1077–1078.
- Milne AV notes: §16 rigidity, pp.67–68 and §17 Néron statement, pp.69–71; neither is used as a proof of general relative dual representability.
- Stacks tags 06DC, 04TK and 0DPS were checked for the exact presentation/quotient interfaces and the distinction between a chosen ample bundle and a polarization homomorphism.

Four `sourceIssues` record corrections in our own words: **E1** global versus fppf-local translation of ample representatives (explicit real elliptic counterexample); **E2** the printed one-gon cubic fails in characteristic two and is nonsplit over R (use y²z+xyz=x³); **E3** the final sheaf in Kass’s rigidity factorization is on S; **E4** the contraction’s retained open is inside the smooth locus. Searches found no published correction; the published Česnavičius version retains E4’s wording. Higher ModularCurvesPartII must update its one-gon example when importing the corrected lower owner.

The original GIT Chapter 7 Theorem 7.9 proof and arbitrary-base dual representability proof remain unread; the precise statements and affected nodes are recorded as gaps. The private library index was consulted, but no private source was needed or copied, and no uncleared book copy was used.

Resume from the twelve named gaps and twenty requests after independent review. Preserve the accepted A0-extension IDs/frontier and apply ownership moves rather than adding competing definitions. This run opens one PR and takes no second job.
