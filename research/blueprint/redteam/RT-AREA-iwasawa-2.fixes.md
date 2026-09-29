# RT-AREA-iwasawa-2: fixes

Fixer: Claude Code, session `cc-e94dc5` (with one subagent per finding group), 29 September 2026 (issue #3965).
- Findings: `RT-AREA-iwasawa-2.result.json`.
- Verdicts: `RT-AREA-iwasawa-2.review.json`.
- Five findings, all confirmed. The review corrects the red team's suggested fix in each case, and the corrected contract is followed here.

**How the fixes are applied.** Every finding asks for stage contracts in campaign roadmap documents:
- `content/campaign/DirichletPadicLFunctions/README.md`;
- `content/campaign/PadicHodgeRegulators/README.md` and `content/campaign/CohomologyComparisons/README.md`;
- `content/campaign/PadicMeasuresIwasawaAlgebras/README.md` and `content/campaign/IntegralIwasawaTheory/README.md`;
- `content/campaign/LocallyAnalyticDistributions/README.md`.

These documents, and the packets that decompose them, are maintained outside the job intake. As in the other area fixes (e.g. `RT-AREA-computational.fixes.md` and `RT-AREA-modeltheory.fixes.md`), this report is the only file changed. Each section gives the **exact edit for the maintainer** at origin/main: the document, stage and line, the replacement or inserted stage text, the import lines for consuming stages, and the packet nodes or requests that follow.

Everything each edit cites was checked:
- **Routes and restructuring decisions:** in the accepted paper routes and restructuring decisions that the reviews name.
- **Absence:** in the pinned libraries (Mathlib `082e2d3`, Tau Ceti `f790474`).
- **Sources:** in the sources themselves, read afresh and hashed. Where a source could not be read, the section says so.

| Finding | Where the edit goes |
|---|---|
| /1 | Morita's Γ_p and Gross–Koblitz, into DirichletPadicLFunctions L3 (odd p) |
| /2 | Ferrero–Greenberg, into L3 after Γ_p; no nonvanishing claim |
| /3 | The classical log-syntomic package, into a new CohomologyComparisons Part II (the revision already requested by route 1 of CN17 and CDN20), not into D.2; D.2 and D.5 import it |
| /4 | Dasgupta–Kakde's character-ring algebra, into PadicMeasuresIwasawaAlgebras L6, with import lines in IntegralIwasawaTheory I.6/I.7 |
| /5 | Finite-slope theory for perfect complexes, into LocallyAnalyticDistributions L4; BCGP25's solid construction goes to a separate later stage |

## /1 (medium, missing): Morita's Γ_p and the Gross–Koblitz formula are routed to DirichletPadicLFunctions L3 but not in its stage text

**Checked.**
- **Stage text.** `content/campaign/DirichletPadicLFunctions/README.md` at origin/main. This is mirrored in `data/atlas.json` as `DirichletPadicLFunctions:L3` (sourceLine 51, context 51–56).
  - L3 runs from line 51 (`## L3. Branches, logarithms and poles`) to line 55.
  - Line 53: "Use Teichmuller decomposition to define the branches and prove Theorems 5.17/5.20. Fix log_p(p)=0 and the logarithm on all algebraic extensions compatibly. Prove the complex logarithmic formula and Leopoldt's p-adic formula of Theorem 6.1, with primitive character, chosen Gauss sum and root of unity. Cover pure p-power conductor as well as nontrivial tame conductor; a proof only on the tame component is not completion."
  - Line 55 is the Theorem 7.1 (pole and residue) paragraph.
  - Line 94, the L3 row of the handoff table, reads: "Prove the pole as an analytic germ in the chosen weight coordinate and its residue transformation under coordinate change; keep the p=2 component construction integral."
  - None of these lines mentions Γ_p or Gross–Koblitz.
  - L3 requires L2, and the chain L0 → L1 → L2 → L3 already puts L0/L2's Gauss sums upstream of L3.
- **Route.** In `research/blueprint/papers/PAPER-DASGUPTA-KAKDE-VENTULLO-18.result.json`, `routes[2]` (route 3) is a source route to `DirichletPadicLFunctions:L3`. Its items are `padic-gamma`, `gross-koblitz` and `ferrero-greenberg`, and its reason reads "L3 already owns the branches, Iwasawa's logarithm and Leopoldt's p-adic formula".
  - In `PAPER-DASGUPTA-KAKDE-VENTULLO-18.review.json` the paper verdict is `accept`, and route 3 is `accept` ("inputs to the case F = Q only, and belong with L3's Kubota–Leopoldt branch").
  - This confirms the review's correction: the mathematics is owned by an accepted route; only the stage contract lacks it.
- **Atlas search.** Over the 1,968 stage titles and descriptions in `data/atlas.json`:
  - there is no match for `Gross.?Koblitz`;
  - the only "Gamma function" matches are StandardDistributions layers 2 and 6 (incomplete Gamma, multivariate Gamma).
  - The review's search over the 2,608-stage assembled atlas found the same.
- **Pinned libraries** (Mathlib 082e2d3, 8,482 `.lean` files; Tau Ceti f790474, 5,477 files).
  - A regex search for `padicGamma|PadicGamma|padic_gamma|p-adic Gamma|p-adic Γ`, `Koblitz` and `Greenberg` finds nothing in either tree.
  - `Morita` matches only Morita equivalence: Mathlib `RingTheory/Morita/`, Azumaya, Brauer group; Tau Ceti `RingTheory/Semisimple/BasicAlgebra.lean` and a quiver file.
  - `Γ_p` matches only Tau Ceti's multivariate Gamma (`Analysis/SpecialFunctions/MultivariateGamma/`) and Mathlib's sections Γ(X, ·) in AlgebraicGeometry.
  - Γ_p and Gross–Koblitz are therefore absent. The new block reuses the following carriers, each read in its source file:
    - Mathlib `gaussSum` (Mathlib/NumberTheory/GaussSum.lean:72) is `∑ a, χ a * ψ a` for any finite commutative ring. This is the positive-sum convention. It is already in the packet baseline and is the carrier of the L2 Gauss-sum nodes.
    - Tau Ceti `TauCeti.teichmuller` (TauCeti/NumberTheory/LocalField/Teichmuller.lean:100) is `𝓀[K]ˣ →* 𝒪[K]ˣ` for a nonarchimedean local field, with image μ_{q−1}. The L3 audit (AUDIT-24) already names it as the source of ω.
    - Mathlib `PadicAlgCl p` (Mathlib/NumberTheory/Padics/Complex.lean:54) is an algebraic closure of Q_p.
- **Source.** The Gross–Koblitz paper (Ann. of Math. 109 (1979) 569–581) was obtained from the public scan the review used: <https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/gross_koblitz.pdf>, SHA-256 `c54a94b53d942cfcad2300de04f4f022ec20b2c3a0a7e110464b699484d3d522`, the same hash as the review's. Physical pp. 2–4 (printed 569–571) were read as images.
  - Introduction: "Let p be an odd prime."
    - Definition: Γ_p(z) = lim_{m→z} (−1)^m ∏_{0<j<m, (p,j)=1} j, with m tending to z through positive integers. This gives a continuous map Z_p → Z_p^*.
    - Recurrences: Γ_p(z+1) = −Γ_p(z) on pZ_p and −zΓ_p(z) on Z_p^*.
    - Γ_p is analytic on pZ_p but "*not* analytic on the closed unit disc".
  - §1 setup.
    - 𝒫 is a prime of Q(μ_N) with 𝒫 ∤ 2N and N𝒫 = q = p^f. One nontrivial additive character Ψ: F_p → μ_p is fixed.
    - (1.2) "note the minus signs": g(a,𝒫) = −Σ_{x∈k_𝒫^*} t(x^{−a(q−1)}) Ψ(Tr x), for a ∈ (1/N)Z/Z − {0}.
    - (1.5): ζ = Ψ(1), and π is the unique (p−1)-st root of −p with π ≡ ζ − 1 mod (ζ − 1)².
    - ⟨a⟩ is taken in (0, 1].
  - Theorem 1.7: g(a,𝒫) = π^{(p−1)Σ_{j<f}⟨p^j a⟩} ∏_{j<f} Γ_p(⟨p^j a⟩) in L_𝔅. The exponent is an integer.
  - The proof (§2, via Stickelberger and Katz) was not extracted.
- **Conventions of the consumers.**
  - L0/L2 (Mathlib `gaussSum`) use the positive sum.
  - The DKV routed item `gross-koblitz` uses the positive sum, with −π^{s(a)} on the right, a fractional part in [0, 1) and 0 ≤ a < q − 1.
  - The EulerSystemsCyclotomicMainConjecture packet node `L4/greither-gauss-sum-vectors` uses the negative sum g = −Σ η^{−1}(a)ψ(Tr a), and at p = 2. It already lists `DirichletPadicLFunctions:L3` as a prerequisite, and its packet gap reads "The Gross–Koblitz and Ferrero–Greenberg evaluations and Gross's non-vanishing are cited, not planned".

**Edit for the maintainer.** README, L3: insert this paragraph after line 53, before the Theorem 7.1 paragraph at line 55.

```markdown
For odd p construct Morita's p-adic Gamma function Gamma_p : Z_p → Z_p^× as the continuous extension from the positive integers of

    Gamma_p(n) = (−1)^n ∏_(0<j<n, p∤j) j,   n ≥ 1.

Prove Gamma_p(n + p^k m) ≡ Gamma_p(n) mod p^k from Wilson's theorem for (Z/p^kZ)^×, extend by density, and prove the values are units. Prove uniqueness: Gamma_p is the only continuous function on Z_p with these values, equivalently the only continuous one with Gamma_p(0)=1 and

    Gamma_p(x+1) = −x Gamma_p(x)  (x ∈ Z_p^×),      Gamma_p(x+1) = −Gamma_p(x)  (x ∈ pZ_p).

Test Gamma_p(0)=1, Gamma_p(1)=−1, Gamma_p(m)=(−1)^m (m−1)! for 1≤m≤p, the unit step Gamma_p(2)=−1·Gamma_p(1) and the non-unit step Gamma_p(p+1)=−Gamma_p(p). Morita's analyticity holds on pZ_p; do not present Gamma_p as one analytic function on the closed unit disc, on which the second recurrence would hold everywhere.

Then prove the Gross–Koblitz formula (Gross–Koblitz, Ann. of Math. 109 (1979), Theorem 1.7, taken with N = q−1). Let p be odd, q = p^f with f ≥ 1, omega_q : F_q^× → mu_(q−1) the Teichmuller character (`TauCeti.teichmuller` on a local field with residue field F_q), and fix one nontrivial additive character Psi : F_p → mu_p in an algebraic closure of Q_p, with zeta_p = Psi(1). Prove that the p−1 roots of X^(p−1) + p lie in Q_p(zeta_p) and that exactly one of them, pi, satisfies pi ≡ zeta_p − 1 mod (zeta_p − 1)^2; pi depends only on Psi. For a ∈ (1/(q−1))Z/Z with a ≠ 0 put chi_a = omega_q^(−a(q−1)), so that every nontrivial character of F_q^× is some chi_a, and let <y> ∈ (0,1] represent y mod Z. Every <p^j a> has denominator dividing q−1, hence prime to p, and lies in Z_p. Prove, in Q_p(mu_(q−1), zeta_p),

    g(a) := −sum_(x ∈ F_q^×) chi_a(x) Psi(Tr_(F_q/F_p) x) = pi^(e(a)) ∏_(j=0)^(f−1) Gamma_p(<p^j a>),
    e(a) = (p−1) sum_(j=0)^(f−1) <p^j a> ∈ Z,

where e(r/(q−1)) is the base-p digit sum of r for 0 < r < q−1. The source's Gauss sum g carries a leading minus sign. Do not reconstruct Gauss sums: import the positive-sum Gauss sum G of L0/L2 (Mathlib's `gaussSum`, defined over any finite commutative ring, hence over F_q), prove g(a) = −G(chi_a, Psi∘Tr), and state the theorem also as G(chi_a, Psi∘Tr) = −pi^(e(a)) ∏_j Gamma_p(<p^j a>); every consumer names the convention it uses. The trivial character is outside Theorem 1.7 (with <0> = 1 its right side would be q, not g(0) = 1). Test separately that G(1, Psi∘Tr) = −1 (Mathlib `gaussSum_one_left`), which is the positive form at a = 0 when the representative is taken in [0,1) and Gamma_p(0) = 1. This block is for odd p only: a dyadic Gamma_2 or Gross–Koblitz formula is a separate source obligation and does not follow from this theorem.
```

**Handoff table, line 94, L3 row.** Append:

> Construct Gamma_p (odd p) and its tests before the Gross–Koblitz formula; state that formula with the source's negative Gauss sum and with the positive sum of L0/L2.

**Notes.**
- **Links and requests.** No new stage link is needed. Gauss sums are upstream through L2, and the Teichmüller lift and algebraic closure are built library declarations. The DirichletPadicLFunctions packet needs:
  - new L3 nodes: the construction of Γ_p, its uniqueness and recurrences, its tests, the choice of π, Theorem 1.7 and the sign dictionary;
  - baseline entries for `TauCeti.teichmuller` and `PadicAlgCl`.

  It needs no new `requests` entry.
- **DKV extraction.** Once the README carries this paragraph, items `padic-gamma` and `gross-koblitz` can move from missing to planned at `DirichletPadicLFunctions:L3`.
- **EulerSystemsCyclotomicMainConjecture packet.** Keep the gap on `L4/greither-gauss-sum-vectors` open. Add to it that DirichletPadicLFunctions L3 covers odd p only. The dyadic Γ_2 and Gross–Koblitz input it uses is its own source obligation; Greither takes it from Gross, J. Math. Soc. Japan 1981, which has not been read.

**Not changed / kept.**
- Ownership stays in L3, as route 3 decided. The red team's fallback of a new layer L5 is not taken; the review says "No new competing roadmap is needed".
- L0/L2 remain the only constructors of Gauss sums; L3 imports them.
- L3's existing text (lines 53 and 55) is unchanged, and so are its p=2 branch obligations (lines 16 and 94). The new block makes no p=2 claim.
- No decomposition of the Gross–Koblitz proof is claimed. It remains a source obligation for the L3 blueprint.

## /2 (medium, missing): the Ferrero–Greenberg derivative formula at s = 0 is not in DirichletPadicLFunctions L3

**Checked.**
- **Stage text.** L3 (quoted in /1) plans the value at one (Theorem 6.1) and the pole (Theorem 7.1). It has no statement about the derivative at s = 0.
  - In `data/atlas.json`, "Ferrero" occurs only in EulerSystemsCyclotomicMainConjecture:L4 ("the independent Ferrero–Washington input") and in IntegralIwasawaTheory:L4 ("Abelian Leopoldt and Ferrero–Washington"). Both concern μ = 0, which is a different theorem.
  - `Ferrero.?Greenberg` has no match.
- **Route.** It is the same accepted route 3 as in /1, item `ferrero-greenberg`. The paper review corrected that item: "The clause 'in particular L_p′(χω, 0) ≠ 0 for χ ≠ 1' is not in the paper and has the wrong hypothesis."
- **Libraries.** As in /1: no Γ_p, and no `Greenberg` anywhere in either pinned tree.
- **Sources.** All three were read directly.
  - **Ferrero–Greenberg, "On the behavior of p-adic L-functions at s = 0", Invent. Math. 50 (1978) 91–102.** GDZ scan <https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0050/LOG_0012.pdf>, SHA-256 `7f56b63b24f651f7a5b92025d789fb95d70ccd6f9a9026375c90337b6852b45b`. Physical pp. 2–8 (printed 91–97) were read as images.
    - Printed p. 91: "Let p be an odd prime and let ψ be a primitive, even Dirichlet character".
      - Interpolation: L_p(1−n, ψ) = −(1 − ψ_n(p)p^{n−1}) B_{n,ψ_n}/n, where ψ_n = ψω^{−n} is primitive.
      - "Assume that (d,p)=1", where d is the conductor of ψ_1.
      - **Proposition 1:** L_p′(0, ψ) = Σ_{c=1}^{d} ψ_1(c) log_p Γ_p(c/d) + (1 − ψ_1(p)) B_{1,ψ_1} log_p(d).
    - Printed p. 92:
      - Γ_p is Morita's limit, with the unit and non-unit recurrences.
      - "L_p(0,ψ)=0 if and only if ψ_1(p)=1".
      - **Proposition 2** (L_p′(0,ψ) ≠ 0 when ψ_1(p) = 1) is a separate result, proved through Gross–Koblitz and Brumer's p-adic Baker theorem.
    - Printed p. 94: L_p(s,ψ) = G_ψ(κ^s − 1) and L_p′(0,ψ) = a_1 log_p(κ).
    - Printed p. 97 (§3):
      - the Gauss sum is again the negative one, γ_c = −Σ θ^{−c}(a)φ(a);
      - "Using the convention that log_p(p) = 0, we have log_p(π) = 0 also".
      - So log_p(p) = 0 enters only through the Gauss-sum form. Proposition 1 evaluates log_p only at units.
  - **Gross, "Two encounters with the p-adic Stark conjecture"** (with Dasgupta), arXiv:2303.03299v1, SHA-256 `876f078d45d2e7a403c31e0b8e809c05ba9f62935d3e060896e51f562955de82`, PDF pp. 3–5. The review's Duke copy, SHA-256 `052d4f5f5aae5a57dfa1dcc669b4e7b431218ddc50619bd457187f557e1b2027` (the same hash as the review's), has the same passage on PDF p. 4.
    - χ is an odd character of conductor N, with the residue characteristic prime to 2N (§1).
    - L_p(χω, 0) = −(1 − χ(p))B_{1,χ}.
    - L_p′(χω, 0) = Σ_{a=1}^{N} χ(a) log_p Γ_p(a/N) + (1 − χ(p))B_{1,χ} log_p(N), where log_p is Iwasawa's logarithm with log_p(p) = 0.
    - "When χ(p) = 1, the derivative is given by the simpler formula", with the regrouping over (Z/NZ)^*/⟨p⟩.
  - **RJW** (the packet's pinned published copy, SHA-256 `78d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6`), PDF pp. 48–49 and 55.
    - Definition 5.18 and Remark 5.19: L_p(θ, s) = ∫ χω^{−1}(x)⟨x⟩^{−s}·µ_η.
    - Theorem 5.20: L_p(θ, 1−k) = (1 − θω^{−k}(p)p^{k−1}) L(θω^{−k}, 1−k).
    - Theorem 7.1 uses the same s-coordinate.
    - Since L(ψ, 1−k) = −B_{k,ψ}/k, RJW's L_p(χω, s) and FG's L_p(s, χω) take the same values at every s = 1−k. Both are continuous on Z_p, so they are the same function, with the same derivative coordinate.
- **Limits of the reading.** The proof of Proposition 1 (FG §2, printed pp. 93–96) was read but not decomposed.

**Edit for the maintainer.** README, L3: insert this paragraph immediately after the /1 paragraph, still before the Theorem 7.1 paragraph (current line 55).

```markdown
After the Gamma construction prove the Ferrero–Greenberg derivative formula (Ferrero–Greenberg, Invent. Math. 50 (1978), Proposition 1). Let p be odd and chi a primitive odd Dirichlet character of conductor N with p ∤ N, its values read in C_p and C through the fixed embeddings of L0; omega is the Teichmuller character of conductor p and B_(1,chi) = (1/N) sum_(a=1)^N chi(a) a. Let L_p(chi omega, s) be the branch of RJW Definition 5.18 with tame part chi and p-part omega, in the s-coordinate of Theorems 5.20 and 7.1 (the variable of <x>^(−s)), and write ' for d/ds in that coordinate. First prove that this is Ferrero–Greenberg's L_p(s, psi) for psi = chi omega (so psi_1 = chi and d = N): both are continuous on Z_p and equal −(1 − chi omega^(1−k)(p) p^(k−1)) B_(k, chi omega^(1−k))/k at every s = 1−k, k ≥ 1, the characters taken primitive as in L2. With log_p the logarithm fixed above (log_p(p)=0; the formula evaluates it only at the units Gamma_p(a/N) and N), prove

    L_p'(chi omega, 0) = sum_(1≤a<N) chi(a) log_p Gamma_p(a/N) + (1 − chi(p)) B_(1,chi) log_p(N).

State this general formula only with its correction term and only in the source's range, p odd and p ∤ N; p | N and p = 2 are outside it. In the exceptional case chi(p) = 1, where L_p(chi omega, 0) = (1 − chi(p)) L(chi, 0) = 0 by Theorem 5.20 at k = 1, deduce

    L_p'(chi omega, 0) = sum_(1≤a<N) chi(a) log_p Gamma_p(a/N)
                       = sum_(c ∈ (Z/NZ)^×/<p>) chi(c) log_p ∏_(j=0)^(f−1) Gamma_p(<p^j c/N>),

with f the order of p mod N; the product in the second form is the one the Gross–Koblitz formula evaluates. Do not assert L_p'(chi omega, 0) ≠ 0 or that the zero at s = 0 is simple. That is Ferrero–Greenberg's Proposition 2, which needs Brumer's p-adic Baker theorem and a proof of its own.
```

**Handoff table, line 94, L3 row.** Append, after the /1 clause:

> then the Ferrero–Greenberg derivative at s = 0 with its (1 − chi(p)) B_(1,chi) log_p(N) term, and its chi(p) = 1 case without a nonvanishing claim.

**Notes.**
- **Links and requests.** No new stage link or `requests` entry is needed: Γ_p comes from /1 and the value at s = 0 from Theorem 5.20, both in L3. The packet needs new L3 nodes for:
  - the comparison of branch and coordinate with FG;
  - Proposition 1;
  - the χ(p) = 1 specialisation and its regrouping.
- **DKV extraction.** Item `ferrero-greenberg` can move to planned at `DirichletPadicLFunctions:L3`. Its phrase "The exact hypotheses on p are those of [9]" can now read "p odd and p ∤ f" (FG printed p. 91).
- **EulerSystemsCyclotomicMainConjecture packet.** Nodes `L4/greither-gauss-sum-vectors` and `L4/greither-trivial-zero-formula` use the formula at p = 2. Ferrero–Greenberg covers odd p only, so their gap stays open, as in /1.

**Not changed / kept.**
- Theorems 6.1 and 7.1 in L3 are unchanged. The formula goes after the Gamma construction, as the review sets.
- These stay out of L3:
  - the nonvanishing L_p′(χω, 0) ≠ 0, which is FG's Proposition 2 and which the accepted paper review removed from the item;
  - any order-of-vanishing statement;
  - Gross's F = Q theorem (DKV item `gross-case-q`, on route 1 to the Part II, where the paper review records it as a corollary of Theorem 1).
- The Ferrero–Washington stages (EulerSystemsCyclotomicMainConjecture L4, IntegralIwasawaTheory L4) are untouched.
- No decomposition of the Ferrero–Greenberg proof is claimed.

## /3 (high, missing): the Fontaine–Messing–Kato log-syntomic package gets an early producer in the CohomologyComparisons Part II; D.2 only applies its smooth specialization

**Checked.**
- **Verdict and correction.** `RT-AREA-iwasawa-2.review.json` /3 and `REV-RT-AREA-iwasawa-2.md` (§ /3, and "Dependency check and fix handoff"). The review confirms that no producer exists. It rejects the red team's ownership (a new PadicHodgeRegulators layer feeding D.2/D.5) and its claim that "two accepted routes" ask D.2 for this material. The handoff tests the candidate edges CR.5, CR.6 → `proposal:classical-log-syntomic` → D.2, D.5. It calls that vertex "a provisional early producer, not a live or accepted new roadmap", and says it does not "mandate the full logarithmic package for every smooth regulator": "import only the exact specializations each application needs."
- **The routes the red team relied on are both rejected.** No other paper route targets D.2 or D.5: all `PAPER-*.result.json` files were searched for routes whose stages include D.2 or D.5.
  - PAPER-COLMEZ-NIZIOL-17 (paper verdict revise). Route 5 → D.2 is rejected: "D.2 is restricted to smooth/unramified regulator constructions; L1, not D.2, owns the local-field Bloch–Kato maps. Items 4,5,8,9 … are now missing." Items /4 (S_n(r)_X), /5 (period morphism), /8 (small-twist isomorphism) and /9 (syntomic exponential) are `missing`, and D.2 now appears only under `previousPlanned`.
  - PAPER-COLMEZ-DOSPINESCU-NIZIOL-20 (CDN20, *Cohomology of p-adic Stein spaces*, verdict revise). Route 7 → D.2 is rejected: "D.2's smooth/unramified regulator construction is a supplier only."
- **The "already requested" revision.** Two Part II requests on the same continuation, both rejected pending revision; no document or stage exists for either.
  - PAPER-COLMEZ-NIZIOL-17 route 1: `part-ii` `CohomologyComparisonsPartIISyntomicNearbyCycles`, parent CohomologyComparisons. Review: "The genuinely new integral log-syntomic and quantitative nearby-cycle extension belongs in that direction as a Part II, after splitting the CP.4 overlap and shared syntomic suppliers."
  - PAPER-COLMEZ-NIZIOL-17 route 4 (CR.5/CR.6) is rejected: "log-syntomic sites, the syntomic fibre sequence and the open filtered comparison are not supplied as stated."
  - CDN20 route 1: `part-ii` `SyntomicCohomologyAndSteinComparison`, parent CohomologyComparisons. Review: "Put the genuinely nonproper syntomic comparison in a CohomologyComparisons continuation … coordinating the Colmez–Nizioł 2017 route."
  - Absence: no such roadmap or stage appears under `content/campaign`, in `data/atlas.json`, or in the assembled atlas. The CohomologyComparisons packet (scope CP.0–CP.6) has no request for it.
- **RS-26 (accepted 2026-09-21).**
  - D.2 is `keep`: "Keep the exact smooth/unramified syntomic and étale regulator comparison, filtered complexes and degree-three/weight-two Bloch formula. Preserve integral ranges."
  - D.5 is `keep`: "… the elliptic application and any bad-reduction logarithmic extension remain separately qualified."
- **Source.**
  - The authors' `logvanishing6.pdf` was downloaded (sha256 `161d72d9…`, the hash the paper review records) but could not be rendered here. I read the arXiv v4 TeX source instead (sha256 `0bf4e60f…`, the review's `arxiv-v4-source`); the review found its text identical on pp. 2–3.
  - §1.1.1 quoted: "Fontaine-Messing, Kato have constructed period morphisms … α^FM_{r,n}: S_n(r)_X → i^*Rj_*Z/p^n(r)′_{X_tr}, r ≥ 0", with Z_p(r)′ := p^{−a(r)}Z_p(r), r = (p−1)a(r)+b(r), 0 ≤ b(r) ≤ p−1.
  - (1.3): "For i ≤ r ≤ p−1 … α^FM_{r,n}: H^i(S_n(r)_X) ≅ i^*R^ij_*Z/p^n(r)_{X_tr} is an isomorphism for X a log-scheme log-smooth over a henselian discrete valuation ring O_K of mixed characteristic", attributed to Kato, Kurihara and Tsuji.
  - The exponential α_{r,i} for "a quasi-compact formal, semistable scheme"; Corollary 1.4: an isomorphism for i ≤ r−1, α_{r,r} injective, and "its cokernel can be very large".
  - §5.1.1: S_n(r) ≃ [J^{[r]}_{cr,n} --p^r−φ--> A_{cr,n}], built from absolute log-crystalline cohomology over W_n(k); Remark 5.1 describes the log-syntomic site.
  - The standing convention (§1) is O_K complete with perfect residue field.
  - Neither I nor the review read the Kato, Kurihara or Tsuji originals ("their proofs are not newly audited here").
  - Source issues carried: E28 (Lemma 3.17 holds only unfiltered), E31 (the modified-twist lattice is not unique when (p−1) | r > 0), E19 (the formal semistable charts have h = 1, §2.2.2), E22 and E25 (descent bound, corrected inequality).
- **Stage texts at origin/main 6c22e3c.** The README text equals the `data/atlas.json` mirror for each of these:
  - `content/campaign/PadicHodgeRegulators/README.md`: D.2 lines 22–26; D.5 lines 48–52.
  - `content/campaign/CrystallineCohomology/README.md`: CR.5 lines 175–195; CR.6 lines 199–220 (for *proper* semistable models).
  - `content/campaign/PrismaticCohomology/README.md`: PR.4 lines 132–152; PR.8 lines 236–269.
  - `content/campaign/CohomologyComparisons/README.md`: CP.4 lines 132–157 (the proper flat semistable B_st comparison).
- **Overlap with PR.4.** PAPER-ANTIEAU-MATHEW-MORROW-ETAL-22 route 3 is **accepted** to PR.3/PR.4. It carries the derived Fontaine–Messing sheaves Z_p(i)^FM on qSyn (/97) and Theorem F (/108): integral identification with the prismatic Z_p(i) for i ≤ p−2, rational for all i, non-logarithmic.
- **Absence.**
  - Pinned Mathlib 082e2d37 and the Tau Ceti tree: 0 files for `syntomic`, `fontaine.?messing`, `nearby.?cycle`, `hyodo`, `log.?structure|prelog`, `log.?crystalline`, `PDEnvelope|DividedPowerEnvelope|PD.envelope` (case-insensitive). Positive controls: `crystalline` 5 files (DividedPowers), `fontaineTheta` 2, `BDeRhamPlus` 1.
  - Atlas: 0 matches for `Fontaine.{0,3}Messing` or `log.?syntomic` in `data/atlas.json` (1968 stages) or in the assembled atlas (`scripts/build.py` `assemble`, run read-only: 2840 stages, 7792 edges).
- **Acyclicity.** In the assembled graph none of CR.5 (16 ancestors), CR.6 (22), LPV.0 (75), ClassicalAdicEtaleCohomology H1 (115) or PadicHodgeRegulators L1 (114) has any PadicHodgeRegulators:D.* stage among its ancestors. The edges below therefore close no cycle. D.2 has 26 downstream stages in `data/atlas.json`, which is why it receives only the good-reduction export.

**Edit for the maintainer.**

**1. New Part II document** `content/campaign/CohomologyComparisonsPartIISyntomicNearbyCycles/README.md`.
- The id is the one PAPER-COLMEZ-NIZIOL-17 route 1 requested; parent CohomologyComparisons, area padic.
- Stage prefix `CP2`, unused in the atlas; it follows the AG2/RG2 pattern.
- This is one continuation shared by both requests: the CDN20 route-1 revision adds its nonproper Stein comparison here, with `SyntomicCohomologyAndSteinComparison` kept only as a cross-reference id.

> # Cohomology comparisons, Part II: integral log-syntomic nearby cycles
>
> ## Scope and ownership
>
> Construct the classical integral logarithmic syntomic complexes of Fontaine–Messing and Kato, their period map to logarithmic p-adic nearby cycles, and the syntomic exponential of semistable formal schemes. CrystallineCohomology CR.5 owns log structures, charts, log PD envelopes and the log-crystalline site; CR.6 owns the Hyodo–Kato complex with φ and N; they are imported, not rebuilt. CohomologyComparisons CP.4 keeps the proper semistable B_st comparison, which is not proved again here. PrismaticCohomology PR.4 and PR.8 keep the prismatic and log-prismatic syntomic theories. PadicHodgeRegulators L1 keeps the local-field Bloch–Kato maps.
>
> Applications import only the specialization they use: PadicHodgeRegulators D.2 imports CP2.0; a bad- or semistable-reduction regulator imports CP2.1 or CP2.2. No regulator layer owns a second syntomic carrier.
>
> ## Conventions
>
> O_K is a henselian discrete valuation ring of mixed characteristic (0,p) with perfect residue field k (the source's convention; nothing is claimed for imperfect k), O_F = W(k), and O_K^× is Spec O_K with the log structure of the closed point. X is an fs log scheme log-smooth over O_K^×, X_0 its special fibre, X_n = X ⊗ Z/p^n, X_tr ⊂ X_K the dense open locus where the log structure is trivial, i : X_0 → X and j : X_tr → X. Mapping fibres are taken in the ∞-derived category.
>
> For r = (p−1)a(r)+b(r) with 0 ≤ b(r) ≤ p−1 put Z_p(r)′ := p^{−a(r)}Z_p(r) and Z/p^n(r)′ := Z_p(r)′/p^n. For r ≤ p−2, a(r) = 0 and the twists coincide. When p−1 divides r > 0 the printed condition allows two pairs (a,b) and two lattices (source issue E31): fix one convention, verify it against the constructed period map, and until then carry the chosen pair as a parameter.
>
> ## Milestones
>
> ### CP2.0. Good-reduction specialization
>
> For X smooth over O_K with the log structure of its special fibre (no horizontal divisor, so X_tr = X_K), construct from CR.5's absolute log-crystalline cohomology of X_n over W_n(k) the complexes RΓ_cr(X, J^{[r]})_n, the sheaves J^{[r]}_{cr,n} and A_{cr,n} on X_{0,ét}, and S_n(r)_X := [J^{[r]}_{cr,n} --p^r−φ--> A_{cr,n}] for r ≥ 0, with Frobenius as in Colmez–Nizioł §5.1.1. Construct the Fontaine–Messing–Kato period map α^FM_{r,n} : S_n(r)_X → i^*Rj_*Z/p^n(r)′_{X_K} for every r ≥ 0, compatibly with n → n−1 and products. Prove: for 0 ≤ i ≤ r ≤ p−1, α^FM_{r,n} induces isomorphisms H^i(S_n(r)_X) ≅ i^*R^ij_*Z/p^n(r)_{X_K}, with the **unmodified** twist and no constants. At r = p−1 the two readings of E31 give different lattices; this statement is the one with Z/p^n(p−1), and its relation to the general-r target is part of E31's normalization obligation. No integral isomorphism is asserted for r ≥ p.
>
> Prove the theorem for the complex and Frobenius normalization of the source that proves it. If that is the divided Frobenius rather than p^r − φ, prove the comparison of the two complexes before transporting it. The functors i^* and Rj_* are the étale site morphisms and derived direct image of the existing scheme carriers used by LefschetzPencilsAndVanishingCycles LPV.0, here for the arithmetic open immersion j, not the geometric generic fibre; no second nearby-cycle functor is built. This stage uses no horizontal divisor, no semistable chart, no Hyodo–Kato complex and no quantitative comparison, so its consumers do not inherit them.
>
> Acceptance: X = Spec O_K with i = r = 1, where the stalk of i^*R^1j_*μ_{p^n} is (K^{sh})^×/p^n by Kummer theory and the class of a uniformizer is attained; compatibility with n → n−1 and with a change of uniformizer.
> Sources: Colmez–Nizioł, *Syntomic complexes and p-adic nearby cycles*, Invent. math. 208 (2017), §1.1.1 and (1.3), pp. 2–3, and §5.1.1, pp. 52–53, quoting Kato (Adv. Stud. Pure Math. 10, 1987; Astérisque 223, 1994), Kurihara (Proc. Japan Acad. 63, 1987) and Tsuji (Invent. math. 137, 1999; Bull. SMF 128, 2000). Before implementing, record from those originals which case each proves, with its exact range and Frobenius normalization.
> Requires: CrystallineCohomology:CR.5, LefschetzPencilsAndVanishingCycles:LPV.0.
>
> ### CP2.1. The classical log-syntomic package for log-smooth schemes
>
> Extend CP2.0 to every fs log scheme X log-smooth over O_K^×. This includes X with semistable reduction or a base change of such, with a horizontal divisor D and X_tr = X_K ∖ D_K, in the chart of Colmez–Nizioł §1.1.1 (supplied by CR.5). Construct the log-syntomic site X_syn of Kato's log-syntomic morphisms with the extra conditions of Colmez–Nizioł Remark 5.1, the sheaves J^{[r]}_n and O^cr_n on it, S_n(r) = [J^{[r]}_n --p^r−φ--> O^cr_n], and the identification Rε_*S_n(r) ≅ S_n(r)_X for ε : X_syn → X_ét. Construct α^FM_{r,n} : S_n(r)_X → i^*Rj_*Z/p^n(r)′_{X_tr} for all r ≥ 0. Prove that for 0 ≤ i ≤ r ≤ p−1 it induces isomorphisms H^i(S_n(r)_X) ≅ i^*R^ij_*Z/p^n(r)_{X_tr} (unmodified twist), restricting to CP2.0 when X is smooth and D = ∅.
>
> For r ≥ p this stage constructs only the period map. Colmez–Nizioł's bounded-torsion theorem for all r (Theorem 1.1 = Theorem 5.4: kernel and cokernel killed by p^{Nr+c_p} when K has enough roots of unity, by p^{N(e,p,r)} in general) is this Part II's quantitative comparison, which the route-1 revision of PAPER-COLMEZ-NIZIOL-17 still has to place, with E22 and E25. It is not strengthened to an integral isomorphism.
>
> Reconciliation with PrismaticCohomology. PR.4 owns the Nygaard syntomic twists and their nearby-cycle comparisons. Through PAPER-ANTIEAU-MATHEW-MORROW-ETAL-22 route 3 it also owns the non-logarithmic derived Fontaine–Messing sheaves on quasisyntomic rings, compared with the prismatic twists integrally for weights ≤ p−2 and rationally for all weights. PR.8 owns the log-prismatic twists and the Kummer-étale comparison under its own hypotheses (perfect log prism, Cartier type). S_n(r)_X is built from CR.5's log-crystalline cohomology, not from either. Where a non-logarithmic complex is needed it is PR.4's, not a rebuilt one. A comparison with PR.4 or PR.8 is stated only with a source proving it, with its hypotheses and range; none is asserted by notation. i^*Rj_* is taken on the ordinary étale site of X_tr, and Kummer-étale cohomology is compared with it only after the log-structure comparison.
>
> Acceptance: the semistable chart O_K[x,y]/(xy−ϖ) in degrees i ≤ r ≤ 1; A^1_{O_K} with D = {x = 0}, where the class of x is attained in degree i = r = 1; restriction to CP2.0.
> Sources: Colmez–Nizioł (1.3), §1.1.1 pp. 2–3, §5.1.1 and Remark 5.1 pp. 52–53; Kato, Astérisque 223; Tsuji, Invent. math. 137, Bull. SMF 128.
> Requires: CP2.0, CrystallineCohomology:CR.5.
>
> ### CP2.2. The syntomic exponential of a semistable formal scheme
>
> Let 𝔛 be a quasi-compact semistable formal scheme over O_K: locally of the standard semistable form with h = 1, p-adically completed, with a divisor at infinity allowed (Colmez–Nizioł §3.6 and §5.1.6; the printed reference "section 2.1.2" means §2.2.2, source issue E19); for example a semistable affinoid. Let 𝔛_{K,tr} be its rigid generic fibre minus the divisor at infinity. For r ≥ 0 and i ≥ 1 construct
> α_{r,i} : H^{i−1}_dR(𝔛_{K,tr}) → H^i_syn(𝔛, r)_Q --α^FM_r--> H^i_ét(𝔛_{K,tr}, Q_p(r)).
> Prove two statements:
> - The first map is an isomorphism for 1 ≤ i ≤ r−1 and injective for i = r (Corollary 3.16, from Proposition 3.12 and Lemma 3.14, using Lemma 3.17 only as an unfiltered quasi-isomorphism, E28).
> - α_{r,i} is an isomorphism for 1 ≤ i ≤ r−1, and α_{r,r} is injective (Corollary 1.4 = Corollary 5.11).
>
> No surjectivity of α_{r,r} or bound on its cokernel is asserted. Remark 3.18's non-surjectivity example rests on Proposition 3.19, which the authors state without proof, and is not a target.
>
> This rational statement for all r differs from CP2.1 in hypotheses (a quasi-compact formal scheme, not a scheme over a henselian base) and in ranges (isomorphism for 1 ≤ i ≤ r−1 and injection at i = r, against 0 ≤ i ≤ r ≤ p−1 integrally). Its étale step uses the rational form of Theorem 5.4, so its theorems are blocked on this Part II's quantitative comparison until that stage is placed.
>
> For a proper semistable scheme X over O_K and 1 ≤ i ≤ r−1, identify α_{r,i} of the associated formal scheme with the Bloch–Kato exponential D_dR(V_{i−1}) → H^1(G_K, V_{i−1}), where V_{i−1} = H^{i−1}_ét(X_{K̄}, Q_p(r)). The exponential is imported from PadicHodgeRegulators L1, and the identification H^1(G_K, V_{i−1}) = H^i_ét(X_K, Q_p(r)) that the source uses is proved, not assumed. The scheme and formal-scheme maps are kept distinct.
>
> Import the Hyodo–Kato complex with φ and N from CR.6 in the scope CR.6 states (proper). The local Hyodo–Kato term of Proposition 3.12 on semistable affinoids is not supplied by that statement; it is an obligation of this stage, or of the CrystallineCohomology continuation requested by the PAPER-COLMEZ-DOSPINESCU-NIZIOL-20 review. Rigid generic fibres and formal nearby cycles come from ClassicalAdicEtaleCohomology H1.
>
> Acceptance: 𝔛 = Spf O_K with r ≥ 2, where α_{r,1} is the Bloch–Kato exponential K ≅ H^1(G_K, Q_p(r)); a one-dimensional semistable affinoid with i = r, where only injectivity is claimed.
> Sources: Colmez–Nizioł §1.1.1 p. 3, Corollary 1.4, Proposition 3.12, Lemma 3.14, Corollary 3.16, Lemma 3.17 (pp. 35–37), Corollary 5.11 (p. 58), source issues E28 and E19; Nekovář–Nizioł, arXiv:1309.7620.
> Requires: CP2.1, CrystallineCohomology:CR.6, PadicHodgeRegulators:L1, ClassicalAdicEtaleCohomology:H1, and the quantitative-comparison stage once placed.

**2. CohomologyComparisons README, "Purpose and proof ownership".** Insert after line 24 ("… retain the hypotheses of their individual source owner."):

> The integral log-syntomic continuation — Fontaine–Messing–Kato complexes, their period map to logarithmic p-adic nearby cycles and the syntomic exponential of semistable formal schemes — is [Part II](../CohomologyComparisonsPartIISyntomicNearbyCycles/README.md). CP.4 keeps the proper semistable B_st comparison, which Part II does not prove again.

**3. PadicHodgeRegulators README, D.2, line 24.**
- Current third sentence: "Establish the comparison with the étale regulator using the appropriate p-adic comparison theorem, including its hypotheses and any integral range restrictions."
- Replace it with:

> Establish the comparison with the étale regulator by applying the good-reduction specialization [CohomologyComparisonsPartIISyntomicNearbyCycles CP2.0](../CohomologyComparisonsPartIISyntomicNearbyCycles/README.md): its period map, and integrally only its range 0 ≤ i ≤ r ≤ p−1 with the unmodified twist; a rational statement outside that range cites its own source. The mapping fibre developed here and CP2.0's S_n(r)_X, which carries the log structure of the special fibre, are different complexes: relate them by a constructed map and use only the degrees in which that map is proved an isomorphism. D.2 does not construct log-syntomic complexes, the Fontaine–Messing–Kato period map or the syntomic exponential, and imports neither CP2.1 nor CP2.2.

- Stage edge: CP2.0 → PadicHodgeRegulators:D.2.

**4. PadicHodgeRegulators README, D.5, line 50.**
- Current third sentence: "State separately the additional logarithmic/syntomic input needed for bad or semistable reduction; it is not supplied by the unramified-field calculation."
- Replace it with:

> Bad or semistable reduction is a separately qualified extension, not part of this stage. When formulated, it imports the exact statements of [CohomologyComparisonsPartIISyntomicNearbyCycles](../CohomologyComparisonsPartIISyntomicNearbyCycles/README.md) CP2.1 — the log-syntomic complexes of the semistable model, the period map, and the isomorphism for 0 ≤ i ≤ r ≤ p−1 with the unmodified twist — and, for rational statements, CP2.2 with its formal-scheme hypotheses and ranges. It does not construct a logarithmic syntomic complex of its own. That input is not supplied by the unramified-field calculation, and the good-reduction regulator of this stage does not require it.

- No edge into D.5 itself; D.5 already reaches CP2.0 through D.2.
- When the extension is created as a successor stage requiring D.5 (the `CR.3:duality` pattern), add CP2.1 → it, and CP2.2 → it if it uses the rational statements.

**5. PrismaticCohomology README, PR.4.** Insert after line 152 (the paragraph ending "comparison of n→n−1 maps."):

> The classical Fontaine–Messing–Kato log-syntomic complexes S_n(r)_X over a henselian discrete valuation ring and their period map to logarithmic nearby cycles are owned by [CohomologyComparisonsPartIISyntomicNearbyCycles CP2.0–CP2.1](../CohomologyComparisonsPartIISyntomicNearbyCycles/README.md), built from CR.5's log-crystalline cohomology; PR.4 does not construct them. PR.4's classical comparison is the non-logarithmic one of PAPER-ANTIEAU-MATHEW-MORROW-ETAL-22 route 3 (derived Fontaine–Messing sheaves on quasisyntomic rings; integral for weights ≤ p−2, rational for all weights), and Part II does not rebuild it. It is not an identification with S_n(r)_X, and PR.4's nearby-cycle comparison and CP2.0–CP2.1's small-twist isomorphism are not derived from one another without a source.

**6. PrismaticCohomology README, PR.8.** Insert between line 265 ("… inferred from the ordinary theorem of PR.7.") and line 266 ("Sources: Koshikawa I …"):

> The log-prismatic Tate twists and Kummer-étale comparison of this stage are not the Fontaine–Messing–Kato log-syntomic complexes of [CohomologyComparisonsPartIISyntomicNearbyCycles CP2.1](../CohomologyComparisonsPartIISyntomicNearbyCycles/README.md). Those are built from CR.5's log-crystalline cohomology over a henselian discrete valuation ring and compared with ordinary étale nearby cycles on the trivial-log locus. Neither stage's comparison theorem is transferred to the other's complexes without a source proving the comparison with its hypotheses and range.

**7. Stage edges.**
- CR.5 → CP2.0; LefschetzPencilsAndVanishingCycles:LPV.0 → CP2.0.
- CP2.0 → CP2.1; CR.5 → CP2.1.
- CP2.1 → CP2.2; CR.6 → CP2.2; PadicHodgeRegulators:L1 → CP2.2; ClassicalAdicEtaleCohomology:H1 → CP2.2.
- CP2.0 → PadicHodgeRegulators:D.2.

These refine the review's tested candidate CR.5/CR.6 → producer → D.2/D.5 so that each application imports only its specialization: CR.6 feeds only CP2.2, and D.2 imports only CP2.0. A cycle would need D.2 or the future D.5 successor to be an ancestor of CR.5, CR.6, LPV.0, H1 or L1, and none is (see Checked).

**Packet notes.**
- No packet covers CR.5, CR.6, PR.4, PR.8, D.2 or D.5. The existing CrystallineCohomology--CR.0, PrismaticCohomology--PR.0 and PadicHodgeRegulators--L3 packets are out of scope, and the CohomologyComparisons packet covers CP.0–CP.6 only.
- The Part II's packet, when written, files these requests:
  - CR.5: fs log structures; the semistable chart with horizontal divisor and ϖ^h (PAPER-COLMEZ-NIZIOL-17/2, planned there); log PD envelopes; absolute log-crystalline cohomology of X_n over W_n(k) with J^{[r]} and Frobenius.
  - CR.6: the Hyodo–Kato complex with φ and N (/176, planned there).
  - LPV.0: the étale site morphisms and derived direct image.
  - H1: rigid generic fibres and formal nearby cycles.
  - L1: the Bloch–Kato exponential.
  - PR.4: the non-logarithmic derived Fontaine–Messing sheaves.

**Not changed / kept.**
- **D.2.** Its smooth/unramified scope, filtered complexes, degree-three/weight-two Bloch comparison and integral ranges (RS-26 keep). D.2 owns no log-syntomic item. The red team's new PadicHodgeRegulators layer is not created: there is no regulator-owned syntomic carrier.
- **D.5.** Its good-reduction curve regulator and existing requirements. The bad-reduction extension stays "separately qualified" (RS-26).
- **Other good-reduction consumers** (GeneralizedHeegnerCycles GH.1, EllipticRegulators ER.8, MotivicEtaleKTheory M.8, KatoEulerSystems L1) get no new edge.
- **CR.5 and CR.6.** Unchanged. They keep log geometry and the Hyodo–Kato complex, and the log-syntomic site and syntomic fibre sequence are not added to them (PAPER-COLMEZ-NIZIOL-17 route-4 review).
- **CP.4.** Unchanged, as owner of the proper semistable B_st comparison. Colmez–Nizioł Corollaries 5.15 and 5.26 are not re-proved.
- **PR.4 and PR.8.** Their constructions are unchanged; they gain only the boundary notes above. The red team's alternative, routing through PR.4/PR.8, is not taken: per the review, neither PR's Nygaard construction nor CP.4 asserts this package.
- **No rejected route becomes accepted:** PAPER-COLMEZ-NIZIOL-17 routes 1, 4 and 5, and CDN20 routes 1 and 7, stay rejected. Items PAPER-COLMEZ-NIZIOL-17/3, /4, /5, /8, /9, /10, /83, /152, /163 and CDN20 /33-fm-syntomic stay `missing` until a revised route citing CP2.0–CP2.2 is reviewed.
- **Content left with those route revisions:** Theorem 1.1's constants and descent (E22), the §§2–4 local machinery, the geometric Corollary 5.12, the §5.2 Banach–Colmez argument, and CDN20's nonproper Stein comparison.

## /4 (medium, missing): L6 does not plan the Dasgupta–Kakde character-group-ring and quadratic-presentation algebra that I.6/I.7 are stated in

**Checked.**

- **Stage texts at origin/main.**
  - `content/campaign/PadicMeasuresIwasawaAlgebras/README.md`, `## L6 — Gorenstein coefficient orders and exact duality`, lines 80–86. Line 84 says: "Supply Fitting ideals, projective presentations, exterior powers and exterior bidual base-change/denominator lemmas under their finiteness/reflexivity hypotheses, reusing the generic Fitting algebra of IntegralHeckeAndGaloisDeterminants." Lines 80–86 never mention character group rings, quadratic presentations, compound matrices or adjugates, transposes, or #.
  - `content/campaign/IntegralIwasawaTheory/README.md`:
    - `## I.6 — Integral Brumer–Stark prerequisites` is lines 54–58. Line 58 says: "Build the Ritter–Weiss modules and their presentations, the comparison to class/ray-class groups, and their Fitting-ideal functoriality."
    - `## I.7 — The integral Brumer–Stark theorem` is lines 60–66. Line 62 ends: "… the Fitting-ideal comparison, and the passage from modified to unmodified data."
    - Neither stage names an import from L6.
  - `data/atlas.json` has the same texts, with these prerequisites:
    - L6 requires L4 and L5; its only consumer is ES.6.
    - I.6 requires I.2 and I.3.
    - I.7 requires IHG.6 and I.6.
  - I searched all 1,968 stage descriptions:
    - "character group ring", "compound matri" and R_Ψ: no matches.
    - "quadratically presented": one match, Tau Ceti ZigzagPreprojective Layer 1.
    - "adjugate": only H4, S5 and CFSGStatement L0.
- **Accepted route.** `research/blueprint/papers/PAPER-DASGUPTA-KAKDE-23.result.json`, route 3, is a source route to `PadicMeasuresIwasawaAlgebras:L6` with 32 items.
  - 13 are missing: 43, 46, 47, 48, 50, 52, 56, 81, 100, 111, 112, 113 and 202. They cover R_Ψ, Lemma 2.2, Corollary 2.3, quadratic presentations, Lemmas 2.4, 2.5 and 2.7, compound matrices, units of R_Ψ, well-definedness of the transpose, R^# with #, Lemma 6.1, and completeness of R_Ψ.
  - 19 are planned. Those planned at L6 include Fitt ⊆ Ann, Lemma 2.6, base change, Lemma 3.9, the contragredient dual, higher Fitting ideals, locally quadratic presentations and (175). Items 42 and 44 (O, O_ψ and the components R_χ) are planned at L4.
  - `PAPER-DASGUPTA-KAKDE-23.review.json` accepts route 3.
  - In the same extraction, 116 items are planned at I.6 and 112 at I.7 (the finding says 115 and 112). They include item 35, "Theorem 1.7(a): Sel_Σ^{Σ'}(H)_p^- is quadratically presented", and item 36, "Theorem 1.7(b): Fitt(Sel^-) = (Θ^#)".
- **RS-16** (`research/blueprint/restructure/RS-16.result.json`, review "accepted", 23 September 2026).
  - L6 is narrowed: "Keep higher-Fitting/order-specific algebra beyond the basic carrier, importing that carrier from StableReduction."
  - The `owners` entry gives the "Finite-presentation Fitting-ideal carrier shared with singular loci" to `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`. It lists L4, L6, I.6 and IHG.6 as former owners.
  - The links StableReduction Layer 1 → L6 and → I.6 are already part of RS-16.
  - L6's phrase "reusing the generic Fitting algebra of IntegralHeckeAndGaloisDeterminants" predates this decision.
- **Upstream Tau Ceti.**
  - StableReduction Layer 1 (`content/tau-ceti/StableReduction/README.md:321`) plans to "Develop Kähler differentials and Fitting ideals far enough to form the relative singular closed subscheme `Sing(f)`".
  - QuiverRepresentations Layer 6 (`content/tau-ceti/RepresentationTheory/QuiverRepresentations/README.md:385`) plans "(6C) the transpose `Tr` and stable equivalence", for a finite-dimensional A = kQ/I.
  - At the Tau Ceti pin (f790474) the 6C construction is built:
    - `TauCeti.AuslanderReitenTranspose` (TauCeti/Algebra/Module/AuslanderReiten/Transpose.lean:94) is `Module.Dual A P₁ ⧸ range (p₁.lcomp Aᵐᵒᵖ A)`, an Aᵐᵒᵖ-module, for any ring A and any linear map p₁.
    - `AuslanderReitenTranspose.linearEquiv` (line 293) gives the equivalence for isomorphic presentation diagrams.
    - Independence of the presentation is proved only for minimal presentations: `IsMinimalProjectivePresentation.nonempty_linearEquiv_auslanderReitenTranspose` (line 481). The library proves such presentations exist over semiprimary rings.
    - So the cokernel construction can be reused as it stands. The projective-summand comparison of arbitrary finite projective presentations over R_Ψ is not supplied.
- **Source.** I fetched the arXiv e-print of 2010.00657v3. Its SHA-256, 4a73268176e1db3f4071b80368bbdec5440716f4f9ce5cee10157fbadc72ff25, matches the extraction's record.
  - **Sections read:** §2.2 (Lemma 2.2, Corollary 2.3 `c:rchi`), §2.3 (Lemmas 2.4 `l:size` to 2.7 `l:abab`), §3.4 (Lemma 3.9 `l:coker` and its proof) and §6.1 (Lemma 6.1 `l:trfitt`, Corollary 6.2).
  - **Setting:** "We fix an odd prime p and a finite extension O of Z_p that contains all the values of all characters G → Q̄_p^*". R_Ψ is "the image of" O[G] → ∏_{ψ∈Ψ} O_ψ.
  - **Transpose:** "Transpose is only well-defined up to homotopy: … M′ ⊕ P ≅ M″ ⊕ Q".
  - **The involution:** "We define R^# = R_{Ψ^#}, where Ψ^# = {ψ^{-1} : ψ ∈ Ψ}. The involution # on O[G] induces mutually inverse O-algebra maps #: R → R^#, R^# → R."
  - **Lemma 6.1:** Fitt_{R^#}(M^tr) = Fitt_R(M)^#, for "the transpose of M associated with any quadratic presentation".
  - **Lemma 3.9, the gap.** The proof ends: "adj_r(A′)·C_r(A)x̃ = adj_r(A′)·C_r(A′)x = det(A′)x. This shows that det(A′)x belongs to the image of ⋀^r R^n → ⋀^r R^m." That display only shows that det(A′)x is adj_r(A′) applied to an element of the image. The review's right-sided identity closes the gap: C_r(A)·ι(adj_r(A′)x) = C_r(A′)·adj_r(A′)·x = det(A′)x.
    - arXiv v1 has the same display.
    - I could not read the published Annals version (paywalled). The review's page numbers (pp. 15–18, 25–26, 40) refer to the PDF, which I did not render.
  - **Lemma 2.4, the descent step.** The step from B′ to B multiplies by det A inside B′, so it uses that x is a non-zero-divisor of B′. That holds when every factor of B′ has characteristic zero. It covers R_Ψ ⊂ ∏ O, the only kind of ring the source applies the lemma to.
- **Absence at the pins (Mathlib 082e2d3, Tau Ceti f790474).**
  - `grep -rli fitting` over both trees finds 7 Tau Ceti files and 6 Mathlib files. All concern Fitting's lemma or Fitting decompositions.
  - In the pinned declaration index, all 18 names containing "fitting" are Lie-module Fitting components.
  - There are no index names for compound matrices, higher adjugates, quadratic presentations or character group rings. The 70 "adjugate" names are all the ordinary adjugate. A source grep for "compound" and "minors" finds nothing relevant.
  - These pinned declarations are present and can be reused:

    | Declaration | Location |
    | --- | --- |
    | `Matrix.mul_adjugate` | Mathlib/LinearAlgebra/Matrix/Adjugate.lean:264 |
    | `exteriorPower.map` | Mathlib/LinearAlgebra/ExteriorPower/Basic.lean:260 |
    | `exteriorPower.map_surjective` | the same file, line 327 |
    | `Module.Basis.exteriorPower` | Mathlib/LinearAlgebra/ExteriorPower/Basis.lean:96 |
    | `MonoidAlgebra.antipode_single` | Mathlib/RingTheory/HopfAlgebra/MonoidAlgebra.lean:44 |
    | `HopfAlgebra.antipodeAlgHom` | Mathlib/RingTheory/HopfAlgebra/Convolution.lean:80 |

  - The last two give g ↦ g⁻¹ on O[G] as an algebra map when G is commutative. The induced isomorphism R_Ψ ≅ R_{Ψ^{-1}} is absent.
- **Links.** I ran a depth-first search over the atlas's 3,508 stage edges and `requires` entries, together with the 3,120 links of all accepted restructurings.
  - Neither I.6 nor I.7 reaches L6, and L6 does not reach QuiverRepresentations Layer 6.
  - So L6 → I.6, L6 → I.7 and QuiverRepresentations Layer 6 → L6 are all acyclic, and none exists yet.
  - L6 → I.7 follows from L6 → I.6 → I.7.
- **Test (ii) below** was checked by hand. For O = Z_p[ζ_p] and λ = ζ_p − 1, R_Ψ is the O-span of 1, u = (0, λ, 0) and v = (0, 0, λ). Here u² = λu, v² = λv and uv = 0, so modulo λ the ring is F_p[u, v]/(u, v)², whose socle (u, v) is two-dimensional.

**Edit for the maintainer.**

*A. `content/campaign/PadicMeasuresIwasawaAlgebras/README.md`, `## L6 — Gorenstein coefficient orders and exact duality`.*

A1. **Line 84.** Replace "reusing the generic Fitting algebra of IntegralHeckeAndGaloisDeterminants." with:

> importing the basic finite-presentation Fitting-ideal carrier from Tau Ceti StableReduction Layer 1 (RS-16), not a second carrier from IntegralHeckeAndGaloisDeterminants; this layer adds only the higher-Fitting and order-specific extensions, including those below.

A2. **Insert after line 84** (before "This is an explicit extension …"):

> **Character group rings.** Let p be an odd prime (the scope of the source), G a finite abelian group, and O the valuation ring of a finite extension of Q_p that contains the values of all characters of G; put Ĝ = Hom(G, O^×). For Ψ ⊆ Ĝ define the character group ring R_Ψ as the **image** of the O-algebra map O[G] → ∏_{ψ∈Ψ} O, x ↦ (ψ(x))_ψ, equivalently O[G]/⋂_{ψ∈Ψ} ker ψ. Prove that R_Ψ is an O-order of finite index in ∏_{ψ∈Ψ} O. It is in general not maximal: never replace it by that product. Write G = G_p × G′ with G_p the p-Sylow subgroup; with L4's integral idempotents for G′, prove O[G] = ∏_{χ∈Ĝ′} R_χ, where R_χ = O[G_p]_χ equals R_{Ψ_χ} for Ψ_χ = {ψ ∈ Ĝ : ψ|_{G′} = χ}. Prove Dasgupta–Kakde Lemma 2.2: for a subgroup I ⊆ G and N_I = Σ_{σ∈I} σ, the kernel of O[G] ↠ R_Ψ with Ψ = {ψ : ψ(I) ≠ 1} is exactly N_I·O[G]. Prove Corollary 2.3: for χ ∈ Ĝ′ and a subgroup I ⊆ G_p, R_χ/N_I R_χ ≅ R_Ψ with Ψ = {ψ ∈ Ψ_χ : ψ(I) ≠ 1}. For nonempty Ψ ⊆ Ψ_χ prove that R_Ψ is a complete local noetherian O-algebra, free of finite rank over O, in which x is a unit as soon as ψ(x) ∈ O^× for one ψ ∈ Ψ. Prove Lemma 2.5: for a non-zero-divisor x of R_Ψ, |R_Ψ/(x)| = |O/(∏_{ψ∈Ψ} ψ(x))|, both sides finite. A character group ring is an order of the kind treated above but is **not automatically Gorenstein**: apply this layer's Gorenstein, self-injective-quotient and exact-duality results to an R_Ψ only after proving it Gorenstein.
>
> **The involution #.** Import the involution g ↦ g^{-1} of O[G] (Mathlib's antipode, `HopfAlgebra.antipodeAlgHom` with `MonoidAlgebra.antipode_single`) and prove ψ(x^#) = ψ^{-1}(x). Deduce that # induces mutually inverse O-algebra isomorphisms R_Ψ ≅ R_{Ψ^{-1}}, Ψ^{-1} = {ψ^{-1} : ψ ∈ Ψ}; write R^# = R_{Ψ^{-1}} for R = R_Ψ, and R^# = R for R = O[G], Z_p[G] or Z[G]. The map # is an endomorphism of R_Ψ only when Ψ = Ψ^{-1}; do not state it as an involution of R_Ψ otherwise. For an R-module M, make M^* = Hom_R(M, R) an R^#-module by (r·φ)(x) = φ(r^#·x).
>
> **Quadratic presentations and Fitting ideals.** Over a commutative ring R, a module N is quadratically presented if there is an exact sequence R^m →φ R^m → N → 0 with m ≥ 1; prove Fitt_R(N) = (det φ). Modules below whose Fitting ideals appear are finitely presented, the domain of the imported carrier (over a noetherian R, finitely generated). Prove Lemma 2.6: if 0 → A → B → C → 0 is exact with C quadratically presented and A finitely presented, then Fitt_R(B) = Fitt_R(A)·Fitt_R(C); if A and C are quadratically presented, so is B. Prove Lemma 2.7: if 0 → A → B → C → 0 and 0 → A′ → B′ → C → 0 are exact, B and B′ are quadratically presented and A, A′ are finitely presented, then Fitt_R(A)·Fitt_R(B′) = Fitt_R(A′)·Fitt_R(B). Prove that a presentation by finitely generated projective modules of the same constant rank is quadratic when R is a finite product of local rings. Prove Lemma 2.4: if B is a subring of finite index in a finite product of principal ideal domains of characteristic zero (for instance R_Ψ ⊂ ∏_{ψ∈Ψ} O), and N is a quadratically presented B-module with Fitt_B(N) = (x) for a non-zero-divisor x such that B/(x) is finite, then N is finite and |N| = |B/(x)|.
>
> **Compound matrices and Lemma 3.9.** Reuse Mathlib's exterior powers, their bases (`Module.Basis.exteriorPower`) and determinants. For an m×n matrix A over a commutative ring R and r ≥ 1, prove that the matrix of ⋀^r A : ⋀^r R^n → ⋀^r R^m in these bases is the compound matrix C_r(A) of r×r minors. For an m×m matrix A′, construct the r-th higher adjugate adj_r(A′) and prove the right-sided identity C_r(A′)·adj_r(A′) = det(A′)·I (for r = 1, `Matrix.mul_adjugate`). If A′ is the submatrix of A on a set J of m columns, prove C_r(A)∘ι_J = C_r(A′), where ι_J : ⋀^r R^J → ⋀^r R^n is induced by the inclusion R^J → R^n. Prove Lemma 3.9: if N ⊆ M are R-modules with N finitely generated and M finitely presented, then for every r ≥ 1 the ideal Fitt_R(M/N) annihilates the cokernel of ⋀^r N → ⋀^r M. In the free case obtain det(A′)x in the image as C_r(A)(ι_J(adj_r(A′)x)) = C_r(A′)·adj_r(A′)·x. Record in the decomposition that this corrects the source: its display adj_r(A′)·C_r(A)x̃ = det(A′)x applies adj_r(A′) to an element of the image of C_r(A) and does not by itself place det(A′)x in that image.
>
> **Transposes.** For a commutative ring R and a presentation P_1 →f P_0 → M → 0 by finitely generated projective R-modules, the transpose attached to it is the cokernel of f^* : Hom_R(P_0, R) → Hom_R(P_1, R). Reuse the cokernel construction `TauCeti.AuslanderReitenTranspose` of Tau Ceti QuiverRepresentations Layer 6C, built for any ring and any presentation map, with `AuslanderReitenTranspose.linearEquiv` for isomorphic presentations. Prove the specialization: for R = R_Ψ (or O[G], Z_p[G], Z[G]) the source's transpose, with the contragredient action above, is that cokernel with scalars restricted along # : R^# ≅ R. Prove that transposes of M from two such presentations become isomorphic after adding finitely generated projective summands, M′ ⊕ P ≅ M″ ⊕ Q: a transpose belongs to a presentation, not to M. Do not rebuild minimal presentations, the stable category or the translate D Tr; the upstream uniqueness theorem for minimal presentations is not what is used here. Prove Lemma 6.1: if M is quadratically presented over R = R_Ψ with square matrix (a_ij), the transpose attached to that presentation is quadratically presented over R^# with matrix (a_ji^#), and Fitt_{R^#}(M^tr) = #(Fitt_R(M)). Prove its excess-generator form, the source's (175): for a free presentation R^t → R^{t+s} → M → 0, the zeroth Fitting ideal over R^# of the attached transpose is #(Fitt^s_R(M)). Both identities concern the transpose of the stated presentation; adding a nonzero free summand makes the zeroth Fitting ideal 0.
>
> **Tests.** (i) G = C_p and Ψ = Ĝ: R_Ψ = O[G] is a non-maximal proper suborder of ∏_{ψ∈Ψ} O. (ii) G = ⟨g⟩ × ⟨h⟩ ≅ C_p × C_p, O = Z_p[ζ_p] and Ψ = {1, ψ_1, ψ_2} with ψ_1(g) = ζ_p, ψ_1(h) = 1, ψ_2(g) = 1, ψ_2(h) = ζ_p: R_Ψ = {(a, b, c) ∈ O³ : a ≡ b ≡ c mod (ζ_p − 1)} is not Gorenstein, since R_Ψ/(ζ_p − 1) ≅ F_p[u, v]/(u, v)² has a two-dimensional socle. (iii) A character χ of G′ with χ ≠ χ^{-1}: # maps R_χ onto the different factor R_{χ^{-1}}. (iv) The zero module presented by R →(1) R and by R² → R, (a, b) ↦ a: the attached transposes are 0 and R, with zeroth Fitting ideals R and 0.

A3. **Line 86, last sentence.** After "Normative arithmetic source: BSS II coefficient hypotheses and §§2–3, with Hypothesis 6.1 reflexivity retained in the later Λ-adic application.", append:

> For the character-group-ring, presentation and transpose targets the normative source is Dasgupta–Kakde, arXiv:2010.00657v3, §§2.2–2.3, Lemma 3.9 and §6.1.

A4. **Link.** Add `tauceti:TauCetiRoadmap/RepresentationTheory/QuiverRepresentations#layer-6-auslander-reiten-theory` → `PadicMeasuresIwasawaAlgebras:L6` (acyclic). The link StableReduction Layer 1 → L6 is already in RS-16 and is not added again.

*B. `content/campaign/IntegralIwasawaTheory/README.md`, `## I.6 — Integral Brumer–Stark prerequisites`.* Insert after line 58:

> Import from PadicMeasuresIwasawaAlgebras L6 the character group rings R_Ψ (images of O[G] in ∏_{ψ∈Ψ} O, p odd) with the isomorphism # : R_Ψ ≅ R_{Ψ^{-1}}, quadratic presentations with Dasgupta–Kakde Lemmas 2.4–2.7, and the transpose of a finite projective presentation with its Fitting identities (Lemma 6.1 and (175)); the basic Fitting carrier comes from StableReduction Layer 1, as RS-16 records. None of these notions is defined here. This stage proves their arithmetic instances: that (∇_Σ^{Σ′})_p and its base changes to character group rings are quadratically presented (property (P4)), that its canonical transpose is Sel_Σ^{Σ′}(H)_p (property (P3)), and Corollary 6.2 and Lemma B.4 for these modules.

**Link.** Add `PadicMeasuresIwasawaAlgebras:L6` → `IntegralIwasawaTheory:I.6`, so that I.6's `requires` gains L6. The link is acyclic.

*C. Same README, `## I.7 — The integral Brumer–Stark theorem`.* Append to line 62:

> The ring-level notions in which Dasgupta–Kakde state and prove these results (character group rings and #, quadratic presentations, Fitting ideals of transposes, and the exterior-power annihilation of Lemma 3.9) are imported through I.6 from PadicMeasuresIwasawaAlgebras L6; this stage states Theorem 1.7 in them and does not define them.

No separate L6 → I.7 link: it is implied by L6 → I.6 → I.7, as the review notes.

*D. Packet notes, `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json`.*
- **`requests`.** Add an entry:
  - `supplier`: `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`.
  - `need`: "Fitting ideals Fitt_i (i ≥ 0) of a finitely presented module over a commutative ring, independent of the presentation, with base change Fitt_i(M ⊗_R R′) = Fitt_i(M)·R′."
  - `neededBy`: the new L6 nodes for quadratic presentations, Lemma 3.9 and transposes.
  - `status`: `open`.
  - `note`: this extends the existing L4 request (Fitt₀ only). If Layer 1 stops short of monotonicity under surjections or Fitt₀ ⊆ Ann (source items 78 and 19), L6 proves them on the imported carrier.
- **`baseline.declarations`.** Add `TauCeti.AuslanderReitenTranspose`, `TauCeti.AuslanderReitenTranspose.linearEquiv`, `Matrix.mul_adjugate`, `Module.Basis.exteriorPower`, `exteriorPower.map`, `HopfAlgebra.antipodeAlgHom` and `MonoidAlgebra.antipode_single`, with the lines above.
- **`sources`.** Add Dasgupta–Kakde arXiv:2010.00657v3 (e-print SHA-256 4a732681…ff25).
- **`coverage`.** Extend L6's `remaining` with the route-3 items of PAPER-DASGUPTA-KAKDE-23.
- **`sourceIssues`.** Add `PadicMeasuresIwasawaAlgebras/E16`, as PROTOCOL.md §18 requires:
  - `kind`: `gap`.
  - `locator`: Lemma 3.9 (`l:coker`), last display of the proof, §3.4 of arXiv v3.
  - `printed`: the display quoted above.
  - `correction`: C_r(A′)·adj_r(A′) = det(A′)·I, applied to the embedded vector ι_J(adj_r(A′)x).
  - `reason`: the image of C_r(A) need not be stable under adj_r(A′).
  - `affects`: `the proof`.
  - `known`: `new`.
  - `searched`: arXiv v1 and v3 have the same display; the Annals version was not accessible.
- **IntegralIwasawaTheory.** No packet for I.6 or I.7 exists at origin/main; the only IntegralIwasawaTheory packet is `IntegralIwasawaTheory--I.8.json`. When one is written, it imports these L6 nodes.

*E. Consistency (optional).* Line 8 of the PadicMeasuresIwasawaAlgebras README ("Generic congruence/Fitting commutative algebra from IntegralHeckeAndGaloisDeterminants is reused …") predates RS-16 in the same way as line 84. It should name StableReduction Layer 1 as the Fitting carrier.

**Not changed / kept.**
- **L6's existing content stays:**
  - the Gorenstein-order, O-dual, self-injective-quotient, exact-duality, lattice/derived-dual and exterior-bidual targets;
  - its tests;
  - the BSS II source;
  - the ES.6–8 boundary.
- **I.6/I.7 keep the arithmetic presentations and the Brumer–Stark comparisons:**
  - ∇ with (P1)–(P4) and the Selmer module;
  - Theorems 1.7 and 3.3;
  - the Fitting-ideal comparison and the passage from modified to unmodified data;
  - the IHG.6 import;
  - the separate DKSW p = 2 obligations. The L6 targets are stated at odd p, as in the source.
- **L6 gets no second Fitting carrier and no Auslander–Reiten development.** Minimal presentations (6B), stable equivalence and τ = D Tr (6C–6D) stay upstream.
- **L4 keeps what it plans:** the prime-to-p character idempotents and the components R_χ (items 42 and 44). L6 uses them.
- **Where the review's corrected contract departs from the finding's suggested fix, the edit follows the review:**
  - R_Ψ is the image, not the product;
  - # is an isomorphism R_Ψ ≅ R_{Ψ^{-1}};
  - the Fitting carrier comes from StableReduction;
  - the transpose construction is reused from QuiverRepresentations 6C.

## /5 (medium, missing): L4 lacks finite-slope theory for perfect complexes, and nothing owns BCGP25's solid finite-slope localization or its Stein setting

**Checked.**
- **Stage text at origin/main.** The file is `content/campaign/LocallyAnalyticDistributions/README.md`, section `## L4. Families and operator theory`, lines 44–48 (atlas `sourceLine` 44). L4 requires L3 only; its consumers include PadicFamilies:L2 and PadicFamilies:L2a.
  - Line 46 plans "continuity and compactness of the semigroup operators used for modular symbols, nuclear/Fredholm determinants in the precise compact-operator setting, slope decompositions, and compatibility with specialization on slope-adapted affinoids".
  - Line 48 is the Acceptance line.
  - The handoff row at line 73 is about modules too ("Construct completely continuous operators and Fredholm determinants on the admitted Banach modules, …").
  - Nothing in the stage mentions complexes, Stein spaces or a solid localization.
- **Nodes.**
  - The 13 integrated L4 nodes in `data/decompositions/LocallyAnalyticDistributions.json` (orthonormalizable-modules through finite-slope-summands) all concern one (Pr) module.
  - So do the 186 L4 nodes of `research/blueprint/packets/LocallyAnalyticDistributions.json`.
  - Text searches over both files for quasi-Stein/Stein, solid, Urban, "slope ≤", K^proj and spectral variety found nothing. "Slope decomposition" appears only in the factor-based splitting (finite-slope-summands, Buzzard Thm 3.3 / Coleman §A4). Urban's h-slope decomposition is planned nowhere.
- **Routes** (paper files under `research/blueprint/papers/`):
  - **BCGP21 route 28** (`routes[27]`) sends item /257 (§6.1.1: compact endomorphisms of perfect complexes, their characteristic series, Coleman's local constancy) to LocallyAnalyticDistributions:L4. The review accepts it. Its reason records misprint E77: "'whose roots all have valuation less than h' should read 'at most h'". E77 is confirmed.
  - **Item /258** (the spectral variety as the support of cohomology) goes to PadicFamilies:L0a/L2a under BCGP21 route 18.
  - **BCGP25 route 4** sends six items to L0/L3/L4 and is accepted: 1.8.5-positive-torus, 2.2.17-quasi-stein, 2.2.17-stein, 4.6.46-finite-slope, 4.6.48-slope-order and 4.6.49.
  - **BCGP25 route 17**, the Part II "quasi-abelian p-adic functional analysis …", is accepted with its title corrected. Its brief: "Import corrected solid coefficients from … VS2 and analytic Banach/LF spaces from … LocallyAnalyticDistributions:L0 … Generic adic coherent cohomology is imported from its geometric owner". Its items include 4.6.16, 4.6.18 (solid quasi-Stein acyclicity), 4.6.19, 4.6.20 and 4.6.26.
  - **CDN20 route 3** (the same Part II) is rejected: "Specify one common exact/derived carrier, its relation to existing abelian derived categories, and imports for all consumers; do not silently assume L0 supplies Banach/Fréchet foundations."
  - **Pilloni (2020) route 18** (K^proj(A), Coleman's local constancy, finite-slope classes) goes to L4 and is accepted. It names Urban's slope condition and misprint E107. **Pilloni route 9** (the spectral varieties Z̃ and Z, Prop. 13.1.3.1) goes to PadicFamilies L0a/L2a and is accepted.
  - The Part II exists in no atlas or roadmap file. All LAD Part II proposals become one pending job, `DESIGN-LocallyAnalyticDistributionsPartII` (queue.json). Under PROTOCOL §15 a Part II builds on its parent, so an L4 import of the whole Part II would close a cycle.
- **Sources read myself** (downloaded 29 Sep 2026; hashes match the extractions):
  - **BCGP21, arXiv:1812.09269v3** (sha256 7c8d74b0…), PDF p. 139: "if Q is a monic polynomial whose roots all have valuation less than h, then Q(U) acts invertibly on M^{>h}" (E77); "an endomorphism U of a perfect complex is said to be compact if it admits a representative Ũ as an endomorphism of a bounded complex M• of projective Banach modules, which is compact in each degree … one defines the spectral variety of U to be the support of the cohomology sheaves H•(M•)".
  - **BCGP25, arXiv:2502.20645v1** (sha256 51d7eacc…):
    - Definition 2.2.17, p. 21: quasi-Stein is an increasing countable affinoid union with dense H^0 restrictions; Stein adds relative compactness, citing [Lü90, 2.4].
    - §4.6.46, which begins on p. 93: the character space Z = W × (G_m^an)^r, W from Z_p[[T(Z_p)]].
    - p. 94: "(−)^fs = f_*f^*", f_n^*M = M ⊗ (O_{Z_n}, O^+_{Z_n})_■, D(Z) after [And21, Thm. 1.6], and M^fs = lim_n (f_n)_*f_n^*M.
    - Remark 4.6.47: "a localization functor … However, it is a stronger form of localization". Its Q_p((X)) example needs s > n, not s ≥ n (E019).
    - pp. 94–95: the slope map s, the order given by T^+ and the functors (−)^{≤λ}.
    - Remark 4.6.49, p. 95: the compact-Banach case via [Ser62, Prop. 12].
    - §1.8.5, p. 9: T^+ and T^{++}.
  - **Urban, Ann. of Math. 174 (2011)** (Annals PDF, sha256 794c550e…):
    - §2.1.6: a perfect complex is a bounded complex of projective Banach modules.
    - Lemma 2.1.8: homotopy Hom equals derived Hom.
    - §2.2.5–2.2.9: the *alternating* determinant is homotopy-invariant.
    - §2.3.1, p. 1706: Q has slope ≤ h if Q(0) ∈ O_L^× and the roots of Q* have valuation ≤ h. Condition (4): Q*(u) is invertible on M_2 for every Q of slope ≤ h.
    - Lemma 2.3.2 and Corollaries 2.3.3–2.3.5; Theorem 2.3.8.
  - **Not read here:** Coleman 1997 Part A, Pilloni 2020, Andreychev 2021, Lütkebohmert 1990 and Serre 1962. Statements from these follow the extraction items and the review's reading.
- **Absence at the pins** (Mathlib 082e2d3, Tau Ceti f790474), by grep over all `.lean` files:
  - `QuasiStein|IsStein|Stein space|Stein exhaustion`: 0 files in each library. The bare word "Stein" occurs only in author citations.
  - `slope decomposition|SlopeDecomposition|finite slope|finiteSlope`: 0 files.
  - `CompletelyContinuous|completely continuous`: 0 files.
  - "characteristic power series": only the docstring of the finite `Matrix.charpolyRev` (Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean:291).
  - `CondensedMod.IsSolid` exists (Mathlib/Condensed/Solid.lean:83), with the naive general-ring caveat and open TODOs.
  - `HomotopyCategory` exists (Mathlib/Algebra/Homology/HomotopyCategory.lean:46). No category of Banach modules exists in either library.
- **Stein elsewhere.** Stage descriptions mention Stein only as complex-analytic (ComplexComparisonPartII:C1) and in IgusaVarietiesAndTorsionConcentration:IG.3 ("connected Stein fibers", undefined). The integrated node `RelativeFarguesFontaine:RF0:annuli/stein-exhaustion-and-higher-acyclicity` proves a specialized Stein exhaustion of Y_S. So "no Stein in the atlas" is too broad, but no stage owns the generic notion or the character-space instance.
  - AdicSpacesPartII:R3 ("Prove the affinoid coherent-sheaf equivalence, acyclicity and the comparison needed for finite affinoid covers", line 61) is the natural generic owner. It already receives BCGP25 §4.6.17 by route 24.
- **Graph.**
  - PadicFamilies:L2a requires LocallyAnalyticDistributions:L4 (README lines 40–42).
  - The new edge AdicSpacesPartII:R3 → LocallyAnalyticDistributions:L5 is acyclic. R3's ancestors are R0, R1, R2, F0 and DeformationAndDerivedPatchingAlgebra:R03.1; none is in LAD, and L5 is new with no consumers.
  - The edge L4 → L5 is acyclic.

**Edit for the maintainer.**

1. **`content/campaign/LocallyAnalyticDistributions/README.md`, L4. Insert after line 46** (keep line 46):

   > State slope decompositions in Urban's form (Urban, *Eigenvarieties for reductive groups*, Ann. of Math. 174 (2011), §2.3.1).
   > - **Slope ≤ h.** Work over a complete extension L of Q_p with v(p) = 1. A polynomial Q ∈ L[T] of degree d is of slope ≤ h if Q(0) ∈ O_L^× and every root of Q*(T) = T^d Q(1/T) has valuation ≤ h.
   > - **h-slope decomposition.** Let M be an L-vector space, with no topology required, and U an endomorphism of M. An h-slope decomposition of M with respect to U is a U-stable decomposition M = M^{≤h} ⊕ M^{>h} such that M^{≤h} is finite-dimensional, det(1 − TU | M^{≤h}) is of slope ≤ h, and Q*(U) is invertible on M^{>h} for every Q of slope ≤ h.
   > - **The complement condition reads "valuation at most h".** BCGP21 §6.1.1 prints "less than h" (PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E77). Pilloni (2020) §13.1.1 prints "strictly greater than h" (PAPER-PILLONI-20/E107). Neither printed form gives uniqueness.
   > - **Properties.** Prove uniqueness, functoriality for U-equivariant maps, and compatibility with U-stable subspaces and quotients (Urban, Lemma 2.3.2 and Corollaries 2.3.3–2.3.5).
   > - **Comparison with the module theory.** Let φ be compact on a (Pr) A-module M, and let P_φ = QS be a factorization as in the finite projective slope summand theorem. Call Sp A slope-adapted for h if, at every x ∈ Max A, Q_x is of slope ≤ h and every zero of S_x has valuation < −h. Prove that on a slope-adapted Sp A the splitting M = N ⊕ F specializes at every x to the h-slope decomposition of the fibre. For A = L it is the h-slope decomposition of M.
   >
   > Extend the operator theory to perfect complexes (BCGP21 §6.1.1, second paragraph, arXiv v3 p. 139; Urban 2011 §§2.1.6–2.2.9; Pilloni (2020) §13.1.2).
   > - **Perfect complexes.** A perfect complex is a bounded complex of (Pr) Banach A-modules with continuous A-linear differentials, taken up to homotopy: Urban's K^pf(Ban_A), Pilloni's K^proj(A). For these complexes homotopy classes and derived-category morphisms agree (Urban, Lemma 2.1.8). Build it on Mathlib's `HomotopyCategory`, over the additive category of (Pr) Banach A-modules and continuous A-linear maps, which neither pinned library has.
   > - **Compactness.** An endomorphism U of a perfect complex is compact if it has a representative Ũ that is compact in every degree. Here Ũ is a chain endomorphism of a bounded complex M^• of (Pr) Banach A-modules representing the complex. Compactness is defined through such a representative; nothing is asserted about an arbitrary representative.
   > - **The auxiliary product series.** For a compact representative, form P_Ũ(T) = ∏_i det(1 − TŨ | M^i), the product (not the alternating product) of the degreewise Fredholm determinants.
   >   - Its zero locus is the spectral variety of Ũ, over which M^• determines a complex of coherent sheaves.
   >   - P_Ũ is not invariant under homotopy-equivalent or quasi-isomorphic replacement, and no such invariance is claimed.
   >   - Neither P_Ũ nor Urban's alternating determinant (§2.2.5) defines the spectral support.
   > - **Slope-≤h complexes.** Suppose Sp A is slope-adapted for h in every degree. Prove:
   >   - the degreewise splittings form a Ũ-stable splitting of complexes M^• = M^{•,≤h} ⊕ M^{•,>h};
   >   - M^{•,≤h} is a bounded complex of finite projective A-modules, compatible with completed base change to slope-adapted affinoid subdomains and with specialization at points;
   >   - for two compact representatives of the same U, both slope-adapted for h over Sp A, the complexes M^{•,≤h} with their endomorphisms are canonically isomorphic in the homotopy category. Hence so is their cohomology H^i(M^{•,≤h}), with the action of U.
   > - **The invariant spectral datum is cohomological.** Let Q = ∏_i Q_i be the product of the degreewise slope-≤h factors. Regard H^•(M^{•,≤h}) as a module over A[T]/(Q), with T acting by U^{−1}. Its support is the local piece of the spectral variety of U. That variety is defined as the support of the cohomology sheaves (BCGP21 §6.1.1; Pilloni §13.1.2, Z = V(Ann H^•)), not as the zero locus of P_Ũ.
   > - **Module case.** For M^• concentrated in degree 0, all of the above reduces to the module theory.
   > - **Also prove:**
   >   - at every rank-one point x, each H^i(M^• ⊗̂_A K_x) has h-slope decompositions for all h (Pilloni §13.1.3);
   >   - Coleman's local constancy: x ↦ dim (M^i ⊗̂_A K_x)^{=h} is locally constant on rank-one points, in each degree (Coleman 1997, Part A, §A5). BCGP21's Theorem 6.3.16 uses h = 0.
   > - **Define** finite-slope classes: f = P(U)f locally on A, for some P ∈ A[T] with P(0) = 0 (Pilloni §13.2.4).
   > - **Scope.** PadicFamilies L2a glues the local supports into the spectral variety and keeps the eigenvariety construction. L4 imports nothing from solid or quasi-abelian foundations.

2. **Same stage, line 48. Replace** the Acceptance line with:

   > **Acceptance:** RJW §§3.7–3.8; order-zero and multivariable tests; the strict slope threshold for R10; universal-character evaluation under scalar extension; a positive-order distribution which is not a bounded measure; M = L with U = a and v(a) = h, whose only h-slope decomposition is M^{≤h} = M (the printed "less than h" admits a second one); adding the contractible complex [N →id N], with a compact φ in both degrees, multiplies P_Ũ by det(1 − Tφ | N)² and changes neither M^{•,≤h} up to homotopy nor its cohomology; a complex concentrated in degree 0 recovers the module slope summand.

3. **Same file. Insert a new stage after line 48**, before `## Shared conventions and sources` (line 50):

   > ## L5. Derived finite-slope localization over character spaces
   >
   > **Dependencies:**
   > - L3 and L4 of this roadmap;
   > - [PadicMeasuresIwasawaAlgebras L0a](../PadicMeasuresIwasawaAlgebras/README.md#l0a--rigid-character-and-weight-spaces) for the character space of T(Z_p);
   > - [AdicSpacesPartII R3](../AdicSpacesPartII/README.md#r3) for quasi-Stein and Stein spaces and their coherent cohomology;
   > - from *Locally analytic distributions, growth, and character spaces, Part II* (BCGP25 route 17), only its exact/derived carrier and solid-comparison stages.
   >
   > L4 imports none of these, and no stage of that Part II imports L5.
   >
   > **Stein spaces.** Use BCGP25 Definition 2.2.17 (arXiv v1 p. 21, after Lütkebohmert 1990, 2.4) from the geometric owner:
   > - an adic space X is quasi-Stein if X = ⋃_n X_n for an increasing countable sequence of affinoid opens of finite type with H^0(X_{n+1}, O) → H^0(X_n, O) of dense image;
   > - X is Stein if some such exhaustion has each X_n relatively compact in X_{n+1}, equivalently the closure of X_n in X_{n+1} is proper over Spa(E, O_E).
   >
   > **The character space is Stein.** Let T be a torus over Q_p with maximal split subtorus T^d of rank r, maximal compact subgroup T(Z_p), valuation map v : T(Q_p) → X_*(T^d) ⊗ Q, and a fixed isomorphism T(Q_p) ≅ Z^r × T(Z_p) (BCGP25 §1.8.5). Its character space is Z = W × (G_m^an)^r, where W = Spa(Z_p[[T(Z_p)]], Z_p[[T(Z_p)]]) ×_{Spa Z_p} Spa(Q_p, Z_p). Prove that Z is Stein, with an explicit increasing affinoid exhaustion Z = ⋃ Z_n.
   >
   > **The finite-slope functor.** Construct the finite-slope functor of BCGP25 §4.6.46 (arXiv v1 pp. 93–94) in solid derived categories.
   > - **Inputs.**
   >   - T^+(Q_p) ⊆ T(Q_p) is the positive monoid of §1.8.5: for T maximal in a Borel subgroup of a quasi-split G, the t with v(α(t)) ≥ 0 for every positive root α. Here T^+(Q_p) = T(Z_p) × Z^s × Z_{≥0}^{r−s}, with s the rank of the maximal split torus in Z(G).
   >   - (Q_p)_■[T^+(Q_p)] and (Q_p)_■[T(Q_p)] are the solidified monoid and group rings.
   >   - D(Z_n) = D((O_{Z_n}, O^+_{Z_n})_■).
   > - **Functors.**
   >   - f_n^*M = M ⊗_{(Q_p)_■[T^+(Q_p)]} (O_{Z_n}, O^+_{Z_n})_■, with right adjoint the forgetful functor (f_n)_*, valued in D(Mod_{T(Q_p)}(Q_p)).
   >   - The induced f^* : D(Mod_{T^+(Q_p)}(Q_p)) → D(Z), where D(Z) is the derived category of quasi-coherent sheaves on Z (Andreychev, as cited by BCGP25), and its adjoint f_*.
   >   - M^fs = f_*f^*M, with the unit M → M^fs and M^fs = lim_n (f_n)_*f_n^*M.
   > - **Localization.** Prove that (−)^fs is a localization that factors through − ⊗_{(Q_p)_■[T^+(Q_p)]} (Q_p)_■[T(Q_p)] and is strictly stronger than it (Remark 4.6.47).
   > - **Slopes** (pp. 94–95). Define:
   >   - the slope map s : Z → X_*(T^d)_R, which factors through the Berkovich space;
   >   - the partial order given by T^+(Q_p);
   >   - the rational opens Z_{≤λ}, whose closures are s^{−1}{λ′ ≤ λ};
   >   - the functors (−)^{≤λ} = (f_{≤λ})_* f^*_{≤λ}, with lim_λ M^{≤λ} = M^fs.
   >
   > **Comparison with L4.** Compare with L4 only where a theorem gives the comparison. In the case of Remark 4.6.49 (p. 95), T^+(Q_p) = Z_{≥0} acts on an E-Banach space M through a compact endomorphism. Prove that:
   > - M^{≤λ} is L4's finite-dimensional slope-≤λ direct summand (Serre 1962, Prop. 12);
   > - f^*M is coherent on G_m^an;
   > - M^fs is pro-finite-dimensional.
   >
   > The derived localization is not assumed to have a compact representative on a bounded complex of (Pr) Banach modules. No identification with L4's slope decompositions, or with finite-slope classes, is inferred from the common phrase "finite slope".
   >
   > **Solid foundations.** Import the solid categories and functors from the Part II's single exact/derived carrier, with its stated relation to the existing abelian derived categories. This is the condition of the review of PAPER-COLMEZ-DOSPINESCU-NIZIOL-20, route 3. L0 is not a substitute for Banach/Fréchet or solid foundations.
   >
   > If that carrier is not used, prove instead a restricted comparison and state its scope exactly: which solid T^+(Q_p)-modules it covers, and which of the functors above it constructs on them. In no case is the routed §4.6.46 construction replaced by L4's Banach slope decompositions.
   >
   > **Acceptance:**
   > - an affinoid is quasi-Stein, but the constant exhaustion of a closed disc is not relatively compact;
   > - the open unit disc, exhausted by closed discs of strictly increasing radii, is Stein;
   > - density of the restriction maps is checked, not inferred from inclusion;
   > - a one-dimensional module on which T^+(Q_p) acts by a continuous character into Q_p^× is its own finite-slope part;
   > - Q_p((X)) has zero finite-slope part although X is invertible on it (Remark 4.6.47, taken with s > n: PAPER-BOXER-CALEGARI-GEE-PILLONI-25/E019);
   > - slope zero for an ordinary character; the one-variable valuation of Remark 4.6.48; two incomparable multislopes;
   > - Remark 4.6.49 for a compact operator on a Banach space.

4. **Same file, handoff table. Replace line 73** with:

   > | `L4` | Construct completely continuous operators and Fredholm determinants on the admitted Banach modules. Prove slope factorization/base change and Urban's h-slope decompositions, with the complement condition at most h. Extend them to compact endomorphisms of perfect complexes, with representative-independent slope-≤h complexes and cohomological spectral support. Then export group-specific operator hypotheses to consumers. |

   Insert after line 73:

   > | `L5` | Import the Stein definitions from their geometric owner and the solid carrier from the Part II. Prove the character space is Stein. Construct M^fs = f_*f^*M and the slope-≤λ functors. Compare with L4 only in the compact Banach case. |

5. **`content/campaign/PadicFamilies/README.md`, L2a, line 42.** Insert after "…compatibility with the linked Banach modules.":

   > For a compact endomorphism of a perfect complex of (Pr) Banach modules, import LocallyAnalyticDistributions L4's complex interface: compactness through a representative, the representative's product series as an auxiliary presentation, and the representative-independent slope-≤h complexes and their cohomology on slope-adapted affinoids. Glue the supports of that cohomology into the spectral variety of the operator (BCGP21 §6.1.1; Pilloni (2020) §13.1.2). Keep this stage's Fredholm-hypersurface and eigenvariety gluing, and do not rebuild the complex-level operator theory here.

6. **Generic Stein owner** (the review requires one owner; my proposal, for the maintainer to confirm). In `content/campaign/AdicSpacesPartII/README.md`, R3, insert after line 61:

   > Define quasi-Stein and Stein adic spaces locally of finite type over a complete nonarchimedean field (BCGP25 Definition 2.2.17; Lütkebohmert 1990, 2.4). A quasi-Stein space has a countable increasing affinoid exhaustion with dense restriction maps; a Stein space has one with each member relatively compact in the next. Prove that coherent sheaves on a quasi-Stein space have Fréchet global sections and vanishing higher cohomology, from the exhaustion and the topological Mittag-Leffler theorem. This is the single generic owner. The Stein exhaustion of Y_S in RelativeFarguesFontaine RF0 and the character spaces of LocallyAnalyticDistributions L5 are instances of it. The solid refinements (BCGP25 4.6.16 and 4.6.18–4.6.20, route 17) belong to the functional-analysis Part II.

7. **Links.** Add AdicSpacesPartII:R3 → LocallyAnalyticDistributions:L5 (acyclic, checked above). L4 → L5 follows from the stage order. When its ids exist, add Part II foundation stage → L5. No Part II stage may require L5, and L4 requires nothing from the Part II. Keep the existing LocallyAnalyticDistributions:L4 → PadicFamilies:L2a.

8. **Packet notes** for `research/blueprint/packets/LocallyAnalyticDistributions.json`.
   - **New requests:**
     - To AdicSpacesPartII:R3: generic quasi-Stein/Stein definitions and coherent acyclicity on quasi-Stein spaces. L5 proves only the character-space instance.
     - To LocallyAnalyticDistributionsPartII (pending `DESIGN-LocallyAnalyticDistributionsPartII`): the exact/derived carrier with its relation to Mathlib's abelian derived categories; (Q_p)_■[T^+(Q_p)] and (Q_p)_■[T(Q_p)]; the analytic rings (O_{Z_n}, O^+_{Z_n})_■ and D(Z_n); and D(Z) on a Stein space as used in §4.6.46. These foundation stages must not import L5.
   - **Coverage:**
     - L4's `remaining` gains Urban's h-slope decomposition and the complex items of edit 1.
     - Add a `not_read` coverage entry for L5.
   - **Design jobs.** Tell `DESIGN-PadicFamiliesPartII`, whose higher Coleman theory consumes BCGP25 §4.6.50 onward via (−)^{K_U,fs}, to import L5.
   - **Route bookkeeping.** BCGP25 route 4 lists L0/L3/L4. Its items 1.8.5-positive-torus, 4.6.46-finite-slope, 4.6.48-slope-order and 4.6.49, and the character-space instance of 2.2.17, are now delivered by L5. The generic 2.2.17 definitions go to the geometric owner. Record L5 in the route's stages when the paper file is next regenerated; the owner roadmap is unchanged.

**Not changed / kept.**
- **L4 as it stands.** Line 46 and the existing Acceptance items are unchanged. So is RS-16's "keep" decision for L4: all 13 integrated nodes, 19 links, the three PadicFamilies node consumers, and the open BGR, product-multiplicativity, spectral-mapping and exercise obligations. The complex-level material becomes new nodes in the next L4 blueprint pass.
- **L4 stays Banach-only.** It imports no solid or quasi-abelian foundations.
- **Where the red team's fix is not followed.**
  - Its "keep the solid formulation out" is not followed for the routed §4.6.46 item, which the review says cannot be met without solid foundations.
  - Its "Fredholm determinant of such a complex" is replaced by the auxiliary product plus the cohomological support.
  - Its "Stein … exhaustions" in L4 are split: the generic notion goes to a geometric owner, and L5 keeps the instance.
- **Other owners unchanged.**
  - RF0's specialized Stein node is untouched.
  - PadicFamilies:L2a keeps its Fredholm hypersurface and eigenvariety gluing, and the Pilloni route-9 items (spectral varieties, Prop. 13.1.3.1).
  - PadicMeasuresIwasawaAlgebras:L0a keeps the character functor (RS-16).
- **Routes.** CDN20 route 3 stays rejected and is not reopened. BCGP21 route 28 and BCGP25 routes 4 and 17 are unchanged, and no paper extraction is edited.
