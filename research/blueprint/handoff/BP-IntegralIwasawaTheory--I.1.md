# BP-IntegralIwasawaTheory--I.1: complete

## Run — Claude (claude-tl2c1R), 2026-10-19

Claimed on issue #759 (bot confirmation in comment 6258253324). The deliverables are:

- `packets/IntegralIwasawaTheory--I.1.json`
- `readmes/IntegralIwasawaTheory--I.1.md`
- `suggested/IntegralIwasawaTheory--I.1.lean`
- this note

The packet status is `complete`, and all 11 stages in scope are `planned`.

### What is done

The packet has 66 nodes, 159 API items, 94 unit tests and 33 planets (at most 6 per layer). It reads 35 baseline declarations at Tau Ceti `f790474` and Mathlib `082e2d3`.

- **I.1 (9 nodes).** Cyclotomic Z_p-extension and layers, indexed by the Z_p-layer and not by a cyclotomic exponent. The full cyclotomic tower, tower ramification, the Iwasawa-algebra coordinate and change of generator, ω_n kernels, the compact Galois action, the equivariant algebra Z_p[[Gal(F∞/k)]], and character-decomposition integrality.
- **I.2 (11 nodes).** Class-group and unit limits, semilocal principal units, Leopoldt map and defect (now the owner, see below), maximal abelian pro-p extensions, class-field identification, the global–local unit sequence, finiteness, weak Leopoldt, CM minus class modules (norm-kernel convention at 2), and the Galois cohomology of real units.
- **I.3 (6 nodes).** General Stickelberger elements Θ_{Σ,Σ'}(s) with the convention χ(Θ) = L(χ⁻¹, s), and their functoriality. Deligne–Ribet/Cassou-Noguès integrality. The Deligne–Ribet dictionary κⁿψ(g) = L_S(1−n, ψ). The Kubota–Leopoldt dictionary over Q. Interpolation uniqueness and pole behaviour.
- **I.4 (6 nodes).** The arithmetic Iwasawa complex and its descent to finite layers. Coinvariant Euler characteristics, written as #(O/f(0)O) over O. Kolster's twisted coinvariant descent. S-enlargement Euler factors; the inertia term is Λ/(Frob_v − Nv). The real-place correction at p = 2.
- **I.5 (9 nodes).** The main-conjecture proposition and the Hida Eisenstein ideal (tame level 1). Ribet's extension and the Hecke/class-group comparison. Divisibility to equality. Mazur–Wiles, with f_k = 1 for k ≡ 0 mod p − 1. Wiles, the going-up induction, and the Euler-characteristic endpoint over F(μ_p) in Kolster's Theorem 3.3 form.
- **I.6 (9 nodes).** Minus parts and duals. Smoothed class groups and smoothed Stickelberger elements. The Sinnott–Kurihara ideal. The minus class number formula. The Selmer module. The Ritter–Weiss module ∇ with (P1)–(P4), its transpose, and its Galois-cohomology property.
- **I.7 (13 nodes).** The full Dasgupta–Kakde route: inclusion implies equality, the extra-congruence cusp form, the group-ring Eisenstein homomorphism, the Galois representation, the cohomology class, the surjection from ∇, the Fitting calculation and the keystone theorem. Also DKSW at p = 2, Kurihara's Theorem 2.12, the p-modified Kurihara formula and Strong Brumer–Stark, Kurihara's formula, Brumer–Stark over Z, and the Rubin consequence.
- **I.10 (3 nodes).** The nonequivariant characteristic ideal at every prime, the Kurihara–Kolster module dictionary at p = 2, and the weight-two finite Euler characteristic with every factor kept.

**I.8, I.9 and L0** are already planned in `packets/IntegralIwasawaTheory--I.8.json`. Their coverage here is `planned`, pointing to that packet. The README section "I.8, I.9 and L0" maps each I.8 contract on this part to its target node:

- I.1 → cyclotomic-zp-extension, cyclotomic-layers, arithmetic-compact-action, equivariant-iwasawa-algebra.
- I.2 → maximal-abelian-pro-p-extensions, class-field-identification, weak-leopoldt, global-local-unit-sequence, leopoldt-map-and-defect.
- I.3 → deligne-ribet-dictionary, interpolation-uniqueness, smoothed-integrality.
- I.6 → selmer-module, cm-minus-parts-and-duals, smoothed-stickelberger, I.3/stickelberger-functoriality.
- I.7 → kurihara-theorem-2-12.

**Route items.**

- Every DK item has a node. Lemma-level items (DK Lemmas 7.1–7.2, A.1–A.9, B.1–B.7) sit in proof steps, with PDF equation numbers (110)–(125).
- BT §§1.0.3, 2.1.1 and 2.2.2 are cited in I.1/cyclotomic-zp-extension, I.1/full-cyclotomic-tower, I.2/class-group-limit and I.2/unit-limits.
- RJW §13.2 is cited in I.1/cyclotomic-layers.

**Red-team findings**, each handled as a `restructure` proposal:

- **RT-AREA-ktheory-2/26.** I.2/leopoldt-map-and-defect owns Leopoldt's map and defect. The I.8 packet's `L4/leopoldt-defect` should import it; that file is outside this job, so the change is left for its owner.
- **RT-AREA-langlands-1/27.** IHG.1 owns the congruence module and ideal. I.5 requests IHG.1 and cites PadicFamilies L1 only as the statement planned today.
- **RT-AREA-langlands-1/8.** There is no IG.1 → I.3 edge. The Hilbert ordinary tower comes through AutomorphicPadicLFunctions L3 and HodgeTateAndCanonicalSubgroups T5.

**Two further ownership proposals:**

- Group-ring Hilbert Eisenstein families stay with AutomorphicPadicLFunctions L3.
- General Stickelberger elements belong to I.3; the CM-specific integral properties belong to I.6.

**Supplier requests.** There are 29, all existing-supplier contracts: 22 to Tau Ceti modules, 3 to PadicMeasuresIwasawaAlgebras, and 1 each to AnalyticNumberTheory AN.4, ColemanPowerSeries, DirichletPadicLFunctions and IntegralHeckeAndGaloisDeterminants.

**Upstream notes.**

- PadicMeasuresIwasawaAlgebras is merged upstream; its §6 owns the DK character-group-ring algebra, and no target here needs a Gorenstein property.
- ProfiniteProPGroups Layer 9 owns the completed group algebra.
- ClassFieldTheory Layers 11–13 supply reciprocity.

**Source issue IntegralIwasawaTheory/E1.** Kolster 2009, p. 6, writes Gal(F(μ_{p^∞})/F) ≅ Γ × Δ with Δ ≅ Gal(F(ζ_{2p})/F). This fails at p = 2: for F = Q(√−2) the group is torsion-free while Gal(F(i)/F) has order 2. I.1/full-cyclotomic-tower is stated correctly, and its test `delta_two_not_gal_i` records the counterexample.

**Incoming requests addressed:** N.6, CMAllPrime, EulerSystemsCyclotomic, NE (the Wiles statement), P.6, SpecialValuesBirchTate (I.2, I.5, I.9, I.10), and AutomorphicCongruences L5b (noted in I.5's remaining list). Two are out of scope and left open:

- EulerSystems' request for an archimedean Rubin–Stark Part II.
- NE's request for the Ritter–Weiss pseudomeasure congruences, which NE.6 owns.

### Checks

- `scripts/check_blueprint.py` on the packet, with `TAUCETI_BASELINE` set to the swarm baseline: 0 errors, 0 warnings.
- Dry atlas assembly with this packet added: 0 skipped links, 84 new stage edges, none removed.
- `lean-check` on the suggested file, at Tau Ceti `f790474` and Mathlib `082e2d3`: it elaborates with 14 `sorry` warnings and no errors.
- The README contains no "sorry".

### What remains (also in the packet's coverage and gaps)

**Unread sources and missing derivations:**

- **G-I2-H2:** no read source states the H² form of weak Leopoldt (NSW 10.3.22 not consulted).
- **G-I2-FEDERER, G-I2-IWASAWA83:** Federer 1982 and Iwasawa 1983 are used only as quoted in Kolster 1989.
- **G-I4-ENLARGE:** left exactness of the S-enlargement sequence; Greenberg 1977 not read.
- **G-I5-WILES:** Wiles 1990 and Mazur–Wiles 1984 are not freely available. The totally real Ribet step is stated from secondary accounts.
- **G-I10-REALPLACE:** the real-place inertia injectivity and the factor 2^{[F:Q]} at p = 2, from Kolster 1989 rather than Federer.

**Refinements:**

- DKSW-BSZ §§3–5 proofs were read by statement only. The p = 2 non-reduced Hecke algebra step in I.7 can be refined to lemma level.
- The ritter-weiss-module node can be refined to DK Appendix A lemma level.
- character-decomposition-integrality can be refined to the explicit I.9 descent lemmas.
- A general leading-term formula at trivial zeros (I.4).

### Where to resume

A reviewer or fixer needs only the four repository files; no scratch file is kept. Source hashes and the date read (2026-10-19) are in `sourceVersions`. The DKSW Ribet paper was read from the maintainer's cleared library and was not copied.
