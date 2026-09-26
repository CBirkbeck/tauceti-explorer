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

**Missing:** Andrews' *The Theory of Partitions*, Eichler–Zagier's *The Theory of Jacobi Forms*, Frenkel–Lepowsowsky–Meurman,
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

---

# Arithmetic proof checkpoint, 27 September 2026

Agent: **ChatGPT (GPT-6 Astra Pro)**. Session: `gpt6-20260927-qm-7c9e`.
Issue: #1042. This section is a continuation worksheet, **not a completed
blueprint or a change of any coverage status**. The earlier passes above retain
their own attribution and verification scope.

## What this pass contributes and what it does not

The following gives a complete elementary reduction of the requested
square-root bound to one explicitly stated input, Selberg's identity. It also
gives local evaluation formulas and the exact vanishing criterion. In
particular, it isolates the singular-root cancellation that a bound obtained
by merely counting roots misses. These are classical arithmetic consequences,
not a claim of a new theorem or of formalisation.

Only this handoff is changed. The existing packet (blob
`11768b9a7a6ae54ebffa3883589af46ae16bddf1`), roadmap document and suggested Lean
file are untouched. The connected Contents reader returned empty content for
the packet, including line-range requests; a complete, validated round trip
through the available whole-file writer was not available. Rather than replace
or truncate it, this pass preserves the proof here for integration. **No packet
nodes, API items, packet unit tests, planets, baseline citations, requests or
sourceIssues are added.** The existing packet is not certified by this pass.

Sources consulted on 27 September 2026:

- A. L. Whiteman, *A sum connected with the series for the partition function*,
  Pacific J. Math. **6** (1956), 159–176: the extracted text around (1.4),
  §§2–4 and §5; [publisher PDF](https://msp.org/pjm/1956/6-1/pjm-v6-n1-p18-s.pdf).
- F. Johansson, *Efficient implementation of the Hardy–Ramanujan–Rademacher
  formula*, arXiv:1205.5991 **v2**, 6 July 2012: (1.6)–(1.7), §2.1 equation
  (2.1), and the surrounding discussion of §2.2;
  [preprint](https://arxiv.org/pdf/1205.5991v2).

Both displayed the Selberg normalization below in the retrieved text; the
older scan's equation extraction is poor, so Johansson supplies the readable
formula. PDF screenshot requests failed with cache misses, and byte downloads
failed; **no new PDF hash or visual-page verification is claimed**. The AMS
request for Lehmer (1938) returned 403, so this pass does not claim to have read
that paper. In particular, the proof of the Dedekind-multiplier-to-Selberg
bridge remains an explicit input, not an established source-decomposition node.
The proof below can be checked independently of the unread source proofs.

## Conventions and the one imported identity

Let k ≥ 1 and n be an integer, put D = 1 − 24n, and write

    e_q(t) = exp(2πit/q),       q ≥ 1.

Use the usual sawtooth ((x)) = x − floor(x) − 1/2 off the integers and zero
on the integers, and the normalization

    s(h,k) = Σ_{j=1}^{k−1} ((j/k)) ((hj/k)),
    A_k(n) = Σ_{0≤h<k, gcd(h,k)=1} exp(πi s(h,k)) e_k(−nh).

In particular A_1(n) = 1. For coprime h,k, Johansson's version with j/k in
place of ((j/k)) agrees: the difference is one half of a sum of sawtooths
through a complete nonzero residue system, which is zero.

The input to this worksheet is exactly

    (S) A_k(n) = √(k/3) Σ_{0≤l<2k, (3l²+l)/2 ≡ −n (mod k)}
                         (−1)^l cos(π(6l+1)/(6k)).

The division by 2 is in the integers, not inversion of 2 modulo k:
l(3l+1) is even. This is Whiteman (1.4), printed p.160, and Johansson (2.1),
preprint p.3. Its version for nonnegative n extends to all integers by
periodicity modulo k on both sides. All conclusions about A below are
conditional on (S) until its proof is integrated with the packet's multiplier
normalization. No Rademacher tail estimate or analytic convergence claim is
needed for the reductions below.

### H1. Replace the cosines by one quadratic-root character sum

Define χ₁₂ by the values 1, −1, −1, 1 on residues 1,5,7,11 modulo 12 and
zero on the other residues. Then (S) is equivalent to

    (R) A_k(n) = √(k/12) Σ_{x mod 12k, x² ≡ D (mod 24k)} χ₁₂(x)e_{12k}(x).

The square condition is well-defined on classes modulo 12k, since changing x
by 12k changes x² by a multiple of 24k. Every such x is prime to 6. Negation
pairs the classes without fixed points, and exactly one member of each pair
is 1 modulo 6. Write it uniquely as 6l+1 with 0 ≤ l < 2k. The equality

    (6l+1)² − D = 24((3l²+l)/2 + n)

identifies the indexing conditions. Also χ₁₂(−x)=χ₁₂(x) and
χ₁₂(6l+1)=(−1)^l. Each pair therefore contributes twice the cosine in (S),
which gives precisely the coefficient in (R).

### H2. CRT factorization, with the additive phases retained

Write k = 2^a 3^b m, where gcd(m,6)=1, and put N=12k. Use the pairwise
coprime moduli

    q₂ = 2^{a+2},   q₃ = 3^{b+1},   q_p = p^v for p^v || m.

For each modulus q choose c_q with c_q(N/q) ≡ 1 (mod q). Let χ₄ take values
1,−1 on 1,3 modulo 4 and zero on even integers; let χ₃ take values 1,−1 on
1,2 modulo 3 and zero on multiples of 3. Their product is χ₁₂, as a check
of the four unit classes modulo 12 shows. Define

    T₂ = Σ_{r mod q₂, r² ≡ D (mod 2q₂)} χ₄(r)e_{q₂}(c_{q₂}r),
    T₃ = Σ_{r mod q₃, r² ≡ D (mod q₃)} χ₃(r)e_{q₃}(c_{q₃}r),
    R_q(D;c) = Σ_{r mod q, r² ≡ D (mod q)} e_q(cr).

Then

    (C) A_k(n) = √(k/12) T₂ T₃ ∏_{p^v || m} R_{p^v}(D;c_{p^v}).

Indeed CRT gives the unique class
x = Σ_q (N/q)c_q r_q modulo N, and hence
e_N(x)=∏_q e_q(c_q r_q). The character factors as χ₄(r₂)χ₃(r₃).
The only additional congruence, at 2, is well-defined modulo q₂:
(r+q₂)²−r² is divisible by 2q₂ because q₂ is even. Thus the global root
condition is exactly the product of the displayed local conditions, and
finite distributivity proves (C).

The c_q are essential. This is not the false assertion
A_{uv}(n)=A_u(n)A_v(n) for coprime u,v with n unchanged. For example direct
evaluation gives A_35(0) approximately −1.6272236651, whereas
A_5(0)A_7(0) is approximately 17.2489015220. These decimal values are a
regression diagnostic; the proof of (C) is the exact CRT calculation above.

### H3. Odd-prime unit roots and lifting

Let p be odd, v ≥ 1, q=p^v, and p ∤ D. If a root r exists modulo q, the roots
are exactly r and −r. For any other root u, p^v divides (u−r)(u+r), while p
cannot divide both factors because p ∤ 2r. Hence one factor is divisible by
p^v. The two roots are distinct. Existence modulo p lifts to every p^v:
if r²−D=p^t B, the lift r+jp^t is a root modulo p^{t+1} exactly when
B+2rj=0 modulo p, which has one solution j because 2r is a unit.

Consequently for p ∤ c,

    R_{p^v}(D;c) = 2 cos(2πcr/p^v)

when a root exists, and it is zero otherwise. The cosine has absolute value
strictly less than 1: equality would force 2cr divisible by p^v, contrary
to p ∤ cr. It is also nonzero, since a quarter-turn cannot have odd
 denominator p^v. Thus every nonempty unit-root factor is nonzero and has
absolute value strictly less than 2.

### H4. Singular roots cancel; counting them is insufficient

Let p be odd, p ∤ c, and p | D. For v=1 the only root is zero, so R_p(D;c)=1.
For v ≥ 2, every root r is divisible by p. Translation by p^{v−1}
preserves the root set because

    (r+jp^{v−1})²−r² = 2rjp^{v−1}+j²p^{2v−2}

is divisible by p^v. Each orbit has p elements, and its exponential sum is

    e_{p^v}(cr) Σ_{j=0}^{p−1} e_p(cj) = 0.

For the last equality set z=e_p(c): z^p=1, z≠1, and
(z−1)(1+z+⋯+z^{p−1})=z^p−1=0. This proves R_{p^v}(D;c)=0, including when
the root set is empty. The exact guardrails are:

- R_25(0;1)=0 although there are five roots, not at most two;
- R_25(0;5)=5, so primitivity of the additive phase must not be dropped;
- R_5(0;1)=1, so v ≥ 2 must not be dropped from the cancellation assertion.

### H5. The exceptional prime 2

Since D=1 modulo 8, a root exists modulo every 2^t, t ≥ 3. Starting with
r=1 modulo 8, if r solves the congruence modulo 2^t then exactly one of
r and r+2^{t−1} solves it modulo 2^{t+1}: their squares differ by 2^t
modulo 2^{t+1}. This proves the required existence by induction.

The roots modulo q₂ with the stronger condition modulo 2q₂ are exactly
r and −r. For two odd roots u,r, one of u−r,u+r has 2-adic valuation
exactly 1 and their product is divisible by 2q₂; thus the other factor is
divisible by q₂. The two classes are distinct because q₂ ≥ 4 and r is odd.
As χ₄(−r)=−χ₄(r),

    T₂ = 2i χ₄(r) sin(2πc_{q₂}r/q₂).

This is nonzero. Its absolute value is 2 when a=0 and strictly less than 2
when a>0. The latter follows because c_{q₂}r is odd, so the angle cannot be
a quarter-turn when q₂ is divisible by 8. It cannot be a half-turn or an
integer turn for any q₂ ≥ 4, which proves nonvanishing.

### H6. The exceptional prime 3

D=1 modulo 3, so H3 gives exactly two roots r,−r modulo q₃. Since
χ₃(−r)=−χ₃(r),

    T₃ = 2i χ₃(r) sin(2πc_{q₃}r/q₃).

It is nonzero, and its absolute value is strictly less than 2 because q₃ is
odd and c_{q₃}r is a unit. When b=0, direct evaluation at the two nonzero
classes modulo 3 gives |T₃|=√3.

### H7. The bound, including its domain at k=1

Let ω(m) count the distinct prime factors of m (ω(1)=0). H3–H6 and (C) give

    |A_k(n)| ≤ 2^{ω(m)} √k                     if b=0,
    |A_k(n)| ≤ (2/√3) 2^{ω(m)} √k              if b>0.

The first uses |T₂|≤2 and |T₃|=√3; the second uses |T₂|≤2 and |T₃|≤2.
Each remaining local factor has absolute value at most 2, including the
singular cases. Therefore

    |A_k(n)| < 2^{ω(k)} √k       for k>1,
    A_1(n) = 1.

For b>0, use 2/√3<2 and ω(k)≥ω(m)+1. For b=0,a>0, use
ω(k)=ω(m)+1. For a=b=0,k>1, at least one odd-prime factor occurs and H3–H4
give strict inequality in the product (or the product is zero). The strict
bound is false at k=1, where equality holds. This is a domain guardrail for
the handoff's abbreviated bound, **not a newly claimed erratum in Lehmer**.

### H8. Exact vanishing criterion

Under (S), A_k(n)=0 if and only if some prime p≥5 dividing k satisfies one
of these conditions:

- D has no square root modulo p;
- p² divides k and p divides D.

H3–H4 characterize exactly when the corresponding local factor is zero.
H5–H6 show that the factors at 2 and 3 never vanish. All the other local
factors are nonzero: the unit-root cosine has odd denominator, and the
singular exponent-one factor is 1. Thus (C), with its positive scalar,
proves both directions. In particular this is not an inference from a small
floating-point value being rounded to zero.

## Reproducible checks

The following standard-library Python check was executed in this session.
It tests every residue n modulo k for 1≤k≤80: **3,240 cases**, comparing the
Dedekind definition, (S), (R) and (C). It separately checks the CRT root-set
bijection and character signs with integer arithmetic, and checks **218
singular (p,v,D) cases** for complete translation orbits. The largest numerical
residual in the executed check was less than 3×10^−14. The complex comparisons
and vanishing comparisons are floating-point regression tests, not certified
error bounds or proofs; the root-set and orbit assertions are exact finite
integer tests. No Lean invocation or repository checker was run.

```python
from fractions import Fraction as F
from itertools import product
import cmath
import math


def factors(n):
    ans, p = [], 2
    while p * p <= n:
        if n % p == 0:
            q = 1
            while n % p == 0:
                n //= p
                q *= p
            ans.append((p, q))
        p += 1
    if n > 1:
        ans.append((n, n))
    return ans


def e(t, q):
    return cmath.exp(2j * math.pi * (t % q) / q)


def chi4(r):
    return 0 if r % 2 == 0 else (1 if r % 4 == 1 else -1)


def chi3(r):
    return {0: 0, 1: 1, 2: -1}[r % 3]


def chi12(r):
    return {1: 1, 5: -1, 7: -1, 11: 1}.get(r % 12, 0)


def dedekind(h, k):
    return sum((F(r, k) - F(1, 2)) *
               (F((h * r) % k, k) - F(1, 2))
               for r in range(1, k) if (h * r) % k)


count, max_error = 0, 0.0
for k in range(1, 81):
    multipliers = [(h, cmath.exp(1j * math.pi * float(dedekind(h, k))))
                   for h in range(k) if math.gcd(h, k) == 1]
    a, b, m = 0, 0, k
    while m % 2 == 0:
        m //= 2
        a += 1
    while m % 3 == 0:
        m //= 3
        b += 1
    N = 12 * k
    qs = [2 ** (a + 2), 3 ** (b + 1)] + [q for p, q in factors(m)]
    cs = [pow(N // q, -1, q) for q in qs]
    for n in range(k):
        D = 1 - 24 * n
        roots = [[r for r in range(q)
                  if (r * r - D) % (2 * q if j == 0 else q) == 0]
                 for j, q in enumerate(qs)]
        xs = {x for x in range(N) if (x * x - D) % (2 * N) == 0}
        crt = {}
        for rs in product(*roots):
            x = sum((N // q) * c * r
                    for q, c, r in zip(qs, cs, rs)) % N
            assert x not in crt
            crt[x] = chi4(rs[0]) * chi3(rs[1])
        assert set(crt) == xs
        assert all(crt[x] == chi12(x) for x in xs)
        local = [sum((chi4(r) if j == 0 else chi3(r) if j == 1 else 1)
                     * e(c * r, q) for r in rs)
                 for j, (q, c, rs) in enumerate(zip(qs, cs, roots))]
        direct = sum(w * e(-n * h, k) for h, w in multipliers)
        root_sum = math.sqrt(k / 12) * sum(chi12(x) * e(x, N) for x in xs)
        factored = math.sqrt(k / 12) * math.prod(local)
        selberg = math.sqrt(k / 3) * sum(
            (-1) ** l * math.cos(math.pi * (6 * l + 1) / (6 * k))
            for l in range(2 * k) if ((3 * l * l + l) // 2 + n) % k == 0)
        err = max(abs(direct - z) for z in (root_sum, factored, selberg))
        max_error = max(max_error, err)
        assert err < 1e-9, (k, n, err)
        bound = (2 / math.sqrt(3) if b else 1) * 2 ** len(factors(m)) * math.sqrt(k)
        assert abs(factored) <= bound + 1e-10
        predicted_zero = any(
            not any((r * r - D) % p == 0 for r in range(p))
            or (q > p and D % p == 0) for p, q in factors(m))
        assert (abs(factored) < 1e-9) == predicted_zero
        count += 1

orbit_cases = 0
for p in (5, 7, 11):
    for v in (2, 3):
        q = p ** v
        for D in range(0, q, p):
            roots = {r for r in range(q) if (r * r - D) % q == 0}
            for r in roots:
                orbit = {(r + j * (q // p)) % q for j in range(p)}
                assert len(orbit) == p and orbit <= roots
            orbit_cases += 1
assert count == 3240 and orbit_cases == 218
print(count, orbit_cases, max_error)
```

## Exact continuation and integration worklist

H1–H8 are local worksheet labels, **not allocated packet ids or baseline
claims**. Preserve existing ids where the packet already supplies these facts.
The proposed dependency split is: H1 consumes (S); H2 consumes H1 and CRT;
H3 and H4 supply the ordinary prime-power factors; H5 and H6 supply the
exceptional factors; H7 and H8 consume H2–H6. Root existence, root uniqueness,
singular cancellation, and the two exceptional evaluations are separate
lemmas, rather than one opaque prime-power theorem. The finite geometric sum
and CRT ingredients must first be matched to their statements in the pinned
libraries, not re-planned or attributed by name alone.

For the finite root-sum definition, keep the following API/tests when
integrating: independence of representatives of c and D modulo q;
R_q(D;−c)=conjugate(R_q(D;c)); the explicit empty-root value; the three exact
singular examples in H4; and the non-example to ordinary multiplicativity in
H2. Every suggested signature retains unchecked implementation status.

What remains before any QM.2 coverage improvement:

1. Read the existing packet in a tool that preserves the whole file and map
   this worksheet onto its actual nodes and requests. This pass cannot assert
   that the worksheet is disjoint from all existing prerequisite nodes.
2. Verify the source PDF pages and their hashes; complete the proof of (S)
   from the packet's Dedekind multiplier, including the Jacobi-symbol and
   inverse-choice conventions. The worksheet deliberately does not assert
   that H1 proves this bridge.
3. Compare the local formulas here with Whiteman's numbered evaluations and
   Lehmer's printed formulas, then decompose the remaining source results.
   The CRT factorization here does not itself check every source theorem or
   supply the shifted-n factorization formulas verbatim.
4. Add only genuinely missing nodes, reconcile the roadmap document and the
   suggested Lean file, and run the packet checker and Lean checks at the
   pinned commits. The document's opening QM.4 status/counts still reflect
   the first pass; reconcile them against the actual packet rather than
   inferring all API/test counts from this historical handoff.
5. Retain the other partial-layer lists and all unresolved cross-roadmap
   requests. This arithmetic checkpoint establishes no analytic remainder
   estimate, source-wide closure, or completion of issue #1042.
