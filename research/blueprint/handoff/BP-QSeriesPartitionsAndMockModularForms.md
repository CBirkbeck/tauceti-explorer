# Handoff — BP-QSeriesPartitionsAndMockModularForms

Job `BP-QSeriesPartitionsAndMockModularForms`, issue #1042. Agent: Claude Code, session `cc-2aeb03`, 24 September 2026.
First pass: no packet or reviewed decomposition existed. No restructuring proposal has this roadmap as a member. RS-06
(accepted) and RS-10 (needs changes) only record links into QM.6 and QM.5.

## Deliverables

- **Packet:** `research/blueprint/packets/QSeriesPartitionsAndMockModularForms.json`.
  - 457 nodes: 198 lemmas, 137 theorems, 105 definitions, 15 constructions and 2 comparisons.
  - 709 API items, 463 unit tests and 42 planets (six per layer).
  - 352 pinned baseline declarations and 48 sources.
  - 60 source issues, 13 gaps, 24 requests and 10 structural proposals.
  - `python3 scripts/check_blueprint.py … --index <pinned index>` reports 0 errors and 0 warnings.
- **Roadmap document:** `research/blueprint/readmes/QSeriesPartitionsAndMockModularForms.md`, one section per layer,
  which agrees with the packet.
- **Suggested Lean file:** `research/blueprint/suggested/QSeriesPartitionsAndMockModularForms.lean`, 8,341 lines in
  namespace `TauCeti.QSeries`.
  - It **compiles**: `lake env lean` at Mathlib `082e2d3` gives only `declaration uses 'sorry'` warnings.
  - Every API item and unit test in the packet occurs in it under its packet name.
  - It imports Mathlib only. The Tau Ceti objects QM.6 uses (the presented Monster) are local stand-ins, named in
    comments.

## What is closed and what remains

| Layer | Status | Nodes | What remains |
|---|---|---|---|
| QM.0 | source decomposed | 43 | nothing in the sources; p(11n + 6) ≡ 0 mod 11 is in QM.5 through the crank |
| QM.1 | partial | 67 | DMZ's heat operator and Taylor isomorphism; the index-1 theory (φ₀,₁, φ₁₀,₁ and the structure theorems); Eichler–Zagier's U_s, V_ℓ, W; Jacobi–Eisenstein series and dimension bounds; the Knopp–Petersson formula for v_η on all of SL(2, ℤ) |
| QM.2 | partial | 44 | the Jacobi-symbol form of exp(πi s(h, k)) (gap); Lehmer's prime-power evaluations and the bound |A_k(n)| < 2^{ω(k)}√k; Whiteman's form of Selberg's formula |
| QM.3 | source decomposed | 66 | nothing in the sources |
| QM.4 | partial | 102 | Zwegers §4.4 (fifth-order mock theta functions); Prop. 3.12, which needs the theta functions with characteristics |
| QM.5 | partial | 72 | ten items, among them Zagier's σ(q), Lawrence–Zagier §§5–6, Folsom–Ono–Rhoades, Bringmann–Rolen for all mock theta functions, Traces §§5–9, and congruences beyond Ramanujan's |
| QM.6 | partial | 63 | a public construction of V♮ (Dong–Griess–Höhn, arXiv:q-alg/9707008, needs a Leech lattice no roadmap constructs); the identification of Aut(V♮) with the presented Monster; the Monster character data and the Conway–Norton table; the invariant form on lattice vertex algebras |

**Acceptance conditions:**

- **QM.0.** A formal identity gives no boundary or root-of-unity value. The only bridge is
  `QM.0/evaluation-of-formal-products`, inside a disc of absolute convergence.
- **QM.2.** The exact formula is kept apart from its truncations, which carry an effective remainder.
- **QM.4.** A mock series comes with its completion and transformation proof. This is met by the seventh-order
  F₇ = H₇ + G₇, its shadow ξ_{1/2}H₇ = −√42·g₇, and the non-modularity statement.
- **QM.5.** Radial limits, Eichler integrals and formal evaluations stay distinct until a comparison theorem joins them.
- **QM.6.** No coefficient pattern is taken as a representation; V♮ is a gap, not a node.

**Request answered:** ClassicalArithmeticCompletion CA.4 asked QM.0 for the formal Jacobi triple product and four
specialisations. They are:

- `QM.0/jacobi-triple-product`;
- `QM.0/jacobi-cube-identity`;
- `QM.0/theta-three-product-identity`;
- `QM.0/theta-two-product-identity`;
- `QM.0/gauss-theta-four-product-identity`.

## Requests made (24)

- **MetaplecticAutomorphicForms MP.7 (4):**
  - half-integral-weight automorphy factors and multiplier systems;
  - Shimura's theta multiplier;
  - Mp₂(ℤ) and the Weil representation;
  - classical half-integral-weight cusp forms.
- **HabiroCyclotomicCompletions HC.1, HC.3 and HC.4.**
- **ArithmeticQuantumTopology QT.4:** the Lawrence–Rozansky formula and the Ohtsuki series for the Poincaré sphere.
- **AutomorphicLFunctionsAndLocalFactors AL.0:** Poisson summation over ℤ^r.
- **Tau Ceti ModularForms:**
  - layers 0 (j = E₄³/Δ, twice), 2, 8 and 11;
  - layers 10A (twice), 10B and 10C.
- **Tau Ceti FuchsianOrbifolds:** layers 2 to 5.
- **Tau Ceti LieHighestWeight:** layers 0 and 3.

## For the orchestrator

1. **Overlap with ArithmeticStatistics ST.5.** That packet already plans `ST.5/gaussian-binomial-coefficient` and
   `ST.5/cauchy-q-binomial-theorem`. PROTOCOL §15 gives a general notion to the most foundational roadmap that uses it,
   so QM.0 plans the Gaussian polynomials over every commutative semiring and the q-binomial theorems. The first
   structural proposal asks ST.5 to import them and keep only its count of subspaces of 𝔽_q^n. This needs a fix job
   on the ArithmeticStatistics packet, which this session wrote under #1038.
2. **Other structural proposals:**
   - Reverse the MP.8 → QM.1 edge, and let MP.7 own the finite Weil representation.
   - Drop the ES.3 → QM.2 edge, and let ExponentialSumsAndCircleMethod ES.0 own Kloosterman sums and the Weil bound,
     which no layer plans.
   - QM.5 owns the definition of quantum modular forms, and QT.7 imports it.
   - Find an owner for the Euler–Maclaurin asymptotic.
   - Sub-layers for QM.5 and QM.6.
   - Analytic ownership of the Hauptmodul statements.
3. **Sources the issue did not list.** Source routes in paper extractions name this roadmap's layers:
   - Andreatta–Goren–Howard–Madapusi Pera, item `maass-xi` (QM.3);
   - Liu et al., items `notation-1-3-1`, `gauss-polynomial-identity` and B01–B04 (QM.0);
   - Shankar–Shankar–Tang et al., item 30 (QM.3);
   - Yu, items 044, 086, 087, 090, 094, 102, 106 and 107 (QM.0).

   They were not checked item by item against this packet. QM.0's Gaussian polynomials and QM.3's ξ-operator probably
   meet several of them. The next queue for this roadmap should name them.
4. **Two proofs of the triple product.** The analytic `QM.1/jacobi-triple-product-analytic` follows Kong–Teo's
   analytic proof. It is also the evaluation of `QM.0/jacobi-triple-product` by `QM.0/evaluation-of-formal-products`
   (with a = e^{2πiz}, x = e^{πiτ}), so an implementer may take either route.
5. **Retired supplier.** The roadmap's inputs name `FoundationsAndLibraryIntegration` (LI.3, LI.4), retired on
   16 September 2026. No node names it.

## Sources

48 free sources were read, among them:

- the Zwegers thesis;
- Bruinier–Funke;
- Bruinier–Ono–Rhoades;
- Hardy–Ramanujan (1918);
- Rademacher (1940), Lehmer (1938, 1939) and Whiteman (1956);
- Kong–Teo on the eta transformation and on Rademacher's formula;
- Zagier's papers on quantum modular forms, the strange identity and traces of singular moduli;
- Lawrence–Zagier;
- Bringmann–Rolen;
- Andrews–Garvan;
- Borcherds (1986, 1988, 1992);
- Jurisich's papers;
- Gannon's survey.

All 25 arXiv numbers recorded in the packet were checked against their abstract pages.

**Missing:** Andrews' *The Theory of Partitions*, Eichler–Zagier's *The Theory of Jacobi Forms*, Frenkel–Lepowsky–Meurman,
Kac's *Infinite-dimensional Lie algebras*, and Rademacher–Grosswald. Public substitutes are used wherever they exist.
