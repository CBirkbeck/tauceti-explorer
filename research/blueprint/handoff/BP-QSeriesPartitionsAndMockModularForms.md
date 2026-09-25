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

---

# Second pass, 25 September 2026 (session `cc-7b31c4`)

A continuation, not a new blueprint: all 457 nodes of the first pass are kept and
**8 are added**, closing QM.4.

## QM.4 is now `source_decomposed`

Three of the seven layers — QM.0, QM.3, **QM.4** — are decomposed. The two items
QM.4 had outstanding were both in Zwegers' thesis, which the packet already held;
the LaTeX e-print of the same version was obtained from the arXiv (SHA-256 of the
gzipped tarball `000d13fb…`) and §3.5 and §4.4 were read in full, proofs
included. That reading is recorded in the source's `readSections`.

**§4.4, the fifth-order mock theta functions — six nodes.** The eight functions
through Andrews' double-sum identities, with the record that **two of Andrews'
printed identities are wrong** and that Zwegers' corrected forms are what is
being defined. Lemma 4.8: the first six as sign-difference sums with
`A = diag(5, −2)`, `c₁ = (2, 5)`, `c₂ = (−2, 5)`, together with `B(c₁, c₂) = −70`
and `Q(c₁) = Q(c₂) = −15`, the computation that puts both vectors in the same cone
component. The completion `H_{5,1}` and correction `G_{5,1}` at level 30.
Proposition 4.10, with the **non-diagonal** T-matrix (it permutes the two
half-argument variants), the S-matrix `M₅`, the Casimir eigenvalue 3/16 and the
boundedness of `G_{5,1}`. Lemma 4.11 for the remaining four. And Propositions
4.13 and 4.14, whose point is easy to lose: **`G_{5,2} = −G_{5,1}`**, so the two
corrections cancel and `F₅ = F_{5,1} + F_{5,2}` is a genuine *holomorphic*
vector-valued modular form of weight 1/2 — its six components being explicit
combinations of the eight functions, the first four already known to Watson. The
mock behaviour of each function is exactly the failure of that cancellation.

**§3.5, Proposition 3.12 — two nodes.** The index-13 weight-1 meromorphic Jacobi
form `(ϑ₀₀ϑ₀₁ϑ₁₀)⁹/(Δϑ₁₁)`, its poles, the base point reducing the singular set
to `{0}`, and the residue there — the **constant** `−128/π` by Jacobi's
derivative formula. The decomposition into 26 coefficient functions plus `512i`
times the completed level-13 Appell function, and the modularity of
`(h_l)_{l mod 26}` with eigenvalue 3/16. Zwegers' correction to the classical
theta transformation table he cites (fourth formula on the right needs `−i`) is
carried. The second node records the boundary Zwegers states himself: **the
example is special** — it is built so the residues are constant, and in general
they are not, the `h_l` are not Casimir eigenfunctions, and one obtains no
real-analytic modular form at all.

## Two process notes

**Numbering.** The first pass's `remaining` list numbered these Lemma 4.8,
Prop. 4.10, Lemma 4.11, Prop. 4.13, Prop. 4.14, and that is correct. Counting
from the LaTeX I first got 4.9/4.11/4.13 by skipping the `remark` environments,
which share the counter. The locators use the printed numbering.

**The Lean additions were not compile-checked.** The first pass states that the
suggested file compiles at Mathlib `082e2d3` with only `sorry` warnings. This
pass adds about 170 lines to the QM.4 section — `fifthForm`, the fifth-order
definitions, `fifthOrderH`/`G`/`M`, the three propositions and the index-13
block — written in the same idiom and reusing `ZwegersForm`,
`indefiniteThetaChar`, `unaryR`, `zetaN`, `thetaIndexLocal` and
`completedAppell`. They are **not** verified: `lake env lean` in the local
TauCeti checkout began cloning Mathlib and its dependencies rather than finding a
built cache, and building Mathlib on this machine is forbidden, so the check was
abandoned rather than pursued. **The compile claim in the first pass covers the
file as it stood, not these additions**, and whoever next has a built toolchain
should re-run it; the likeliest breakages are the `Matrix` literal for `M₅` and
the `ℕ × ℤ` summation index in the two `fifthOrder` double sums.

## Where the leverage is now

Four layers remain `partial`, with the first pass's lists unchanged:

- **QM.2** (3 items) — Lehmer 1938 §§3–4 and Whiteman 1956 §§2–6, **both already
  held and hashed**, plus a public proof of the Dedekind-sum congruences. The
  smallest remaining list, and two thirds of it is reading rather than
  acquisition: this is the best next target.
- **QM.1** (5 items) — three of them are DMZ §§4.2–4.4, and **DMZ is held**; the
  other two (Eichler–Zagier's Jacobi–Eisenstein series with the dimension bound,
  and Knopp–Petersson on all of `SL(2, ℤ)`) need sources that were not located.
- **QM.5** (10 items) — the largest list, but mostly sections of Zagier and
  Lawrence–Zagier papers that are already held.
- **QM.6** (4 items) — the only layer whose remaining work needs sources that are
  not held at all: a public construction of `V♮`, the Monster character-table
  data and the Conway–Norton tables.
