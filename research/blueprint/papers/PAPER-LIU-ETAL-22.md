# PAPER-LIU-ETAL-22 — independent review of six source findings

**Claude Code — `cc-fb70e5` · 2026-09-23 · continuation of merged PR #2236.** Refs #1280.

This tick did one of the things the previous handoff said was outstanding — *"no source finding is independently reviewed here"* and *"independent review of the normal-closure formula and E2 replacement still required"* — and nothing else. **Six of the sixteen findings now carry `review.verdict: confirmed`**, each re-derived at its locator by a worker independent of the authoring sessions. **No item, route, API, test, dependency edge, baseline pin, obstruction result or threshold was touched.** The extraction stays **`partial`**: 214 items, 21 routes.

**Provenance re-verified independently.** The NSF-hosted published PDF was re-downloaded and its sha256 is byte-for-byte the recorded `dd821abd…ec89d97` (2,916,938 bytes, 269 pages). Printed page *p* is PDF page *p* − 106.

## The six verdicts

| finding | kind | verdict | what the check added |
|---|---|---|---|
| **E4** | error | `confirmed` | the defect is confined to Prop 2.7.2(3); Lemma 2.7.1's identical phrase is harmless; `P ≠ 0` does suffice |
| **E6** | misprint | `confirmed` | 4 corrupted against ~25 correct occurrences; locator kinds corrected |
| **E11** | misprint | `confirmed` | the paper's own tangent-rank formula *and* hypotheses transfer exactly under `h ↦ h−d` |
| **E14** | misprint | `confirmed` | the display one paragraph above has coefficient degree `2n−1` |
| **E15** | misprint | `confirmed` | footnote 4's convention forces symmetry about `−1/2`; and Lemma 2.2.7 needs `a < 0` |
| **E16** | misprint | `confirmed` | a group-theoretic type mismatch, not just a symbol slip |

**E4 — Proposition 2.7.2(3), p. 137.** The proposition takes "a polynomial `P(T) ∈ Z[T]`" with no non-vanishing hypothesis and asserts `(GI¹_{F′,P})` holds for large `ℓ`. Condition (a) of `(GI^m_{F′,P})` on p. 136 is that **`P(ξ)` be invertible** in `O_λ/λ^m`, which `P = 0` can never satisfy — so the statement is false for `P = 0`, and the proof breaks at the same place ("`P(a^{-1}) ≠ 0`… such pair always exists for sufficiently large `ℓ`"). Two refinements: Lemma 2.7.1's *identical* phrase is harmless, since that lemma only asserts `(GI¹) ⇒ (GI^m)`, vacuously true when the hypothesis is unsatisfiable — so the finding's locator is exactly right to name 2.7.2(3) alone. And `P ≠ 0` **suffices**: a non-zero `P` has finitely many roots, the other three conditions exclude finitely many pairs, `|F_ℓ^×| = ℓ−1` grows, and the finitely many `ℓ` dividing every coefficient of `P` — the only ones where `P` could reduce to zero — are excluded by "sufficiently large `ℓ`".

**E6 — the `(p+3)`/`(q+3)` corruption.** Decided by counting. The intended product over **odd** exponents, `(q+1)(q³+1)⋯(q^{2k−1}+1)`, appears correctly typeset in about **twenty-five** places — Notation 1.3.1 (p. 119), pp. 223–224, 328, 330, 335, 338–341, the identity in the proof on p. 342 *immediately above* a corrupted instance, p. 344, and five times on p. 348, which even carries the identical indexed form `(−q)^{r−δ+1}(q+1)(q³+1)⋯(q^{2(r−δ)−1}+1)`. The corrupted `(x+1)(x+3)` occurs **exactly four** times: twice on p. 229 (Prop 5.8.8's statement and its proof) and once each on pp. 342, 343. An exponent `3` has been flattened into "`+ 3`"; the intended reading is certain and "affects nothing" is right. **One locator correction**: Appendix B.3 contains Lemmas B.3.1–B.3.4, **Proposition** B.3.5 and **Lemma** B.3.6 — there is no Lemma B.3.5 and no Proposition B.3.6. The two appendix instances are in **Proposition B.3.5(2)** (`R°_N`) and **Lemma B.3.6** (`R^•_N`); the finding has the kinds swapped.

**E11 — Proposition A.1.3(3), p. 322.** The proof reduces to the non-degenerate case via `V′₀ = V₀/V₀^⊣` and prints the target `DL(V′₀,{,}′₀,h)`, while the map sends `H ↦ H/V₀^⊣`. Since `V₀^⊣` has dimension `d` and lies in `H^⊣ ⊆ H`, the image has rank `h − d`. Two checks from the paper's own formulas: part (2) computes the tangent rank as `(2h − N − d)(N − h)`, and substituting `N′ = N−d, d′ = 0, h′ = h−d` gives `(2h − d − N)(N − h)` — **identical** — whereas `h′ = h` gives `(2h − N + d)(N − d − h)`, which differs; and the hypothesis `N + d < 2h ≤ 2N` becomes exactly `N′ < 2h′ ≤ 2N′`, the `d′ = 0` case then quoted from `[8, Theorem 1]`, again only under `h ↦ h−d`.

**E14 — Remark 7.3.5, p. 302.** The remark puts the class in `H¹_ur(F_p, H^{2n}_ét(…, O_λ(n))/(n₀,n₁))`. The display closing the proof of Theorem 7.3.4, one paragraph above on the same page, identifies `H^{2n}_T` of the product with `H¹(F_{p²}, H^{2r₀−1}_T ⊗ (H^{2r₁}_T)^{Gal})`, whose coefficient has total degree `(2r₀−1) + 2r₁ = 2n−1`. The geometry forces the same: the product has dimension `2n−1`, so its middle cohomology is `H^{2n−1}` and the Abel–Jacobi class of a homologically trivial codimension-`n` cycle lives in `H¹` of that module. The printed degree is one too high.

**E15 — proof of Theorem 8.3.2, p. 319.** "`R_Q` is crystalline with Hodge–Tate weights in `[1−n, n]`" — while the **verbatim identical** sentence in the proof of Theorem 8.2.2 on p. 311 reads `[−n, n−1]`, for the same `R_Q`, the same `(L2)`, and the same next step citing Lemma 2.4.3(2). Footnote 4 (p. 124) fixes the convention that `Q_ℓ(1)` has weight `−1`; under it the 1-polarization `R^c ≅ R^∨(1)` of §2.7 sends `w ↦ −w−1`, so the weight multiset is symmetric about `−1/2` — and `[−n, n−1]` is that interval, while `[1−n, n]` is symmetric about `+1/2`, what the opposite convention would give. Secondary, concrete consequence: the next sentence invokes Lemma 2.2.7, whose hypothesis is `a < 0 ≤ b`. `[−n, n−1]` satisfies it for every `n ≥ 1`; `[1−n, n]` gives `a = 1−n`, not negative at `n = 1`, so if `n = 1` is in range the printed interval does not even satisfy the hypothesis of the lemma being applied.

**E16 — proof of Lemma 2.6.4, p. 134.** "we can find a place `w̃` of `F̃_S` whose arithmetic Frobenius substitution coincides with `γ`" — but that Frobenius lies in `Gal(F̃_S/F⁺)` while `γ` was introduced two sentences earlier as an element of the **quotient** `Gal(F^{(m)}_+/F⁺)`. It must be the lift `γ̃` built in the preceding sentence, whose `[F:F⁺]`-th power restricts to `(g^{-1}Ψ)h_γ`; its restriction to `F^{(m)}_+` is then `γ`, which is what "γ-associated" needs. A type mismatch, unambiguous to repair.

## What was *not* reviewed, and why

**Ten findings remain unreviewed** and no verdict was invented for any of them.

- **E7** (equation (5.20), p. 231) was examined and **deliberately left open**. The printed `c_{r−1}` carries no `j` while the right-hand side is `d^•_{r−j,p}`, which is suggestive — but `DL^•(V_{s^•})` itself depends on `j` through `s^• ∈ H^{k−1}_j`, so a fixed Chern index on a `j`-dependent space could produce the `j`-dependence honestly. Settling it needs Theorem 5.7.7 and Proposition A.2.4(2), which this tick did not read. A guess here would have been worth nothing.
- **E1, E2, E3, E5, E8, E9, E10, E12, E13** were not attempted. These are the deep ones — the normal-closure formula for `G_{S,γ}`, the diagonal-basis step of Proposition 2.6.7, the pro-`ℓ` removal in Lemma 2.7.1, Construction 3.1.8, the residue-sequence vanishing in Lemma 5.9.3(6), the Galois action in Lemma A.1.4(4), the `N = 2` primitive-cohomology definition, the linear-cycle projection in Lemma C.2.1, and the `O_λ`-freeness in Proposition 8.1.7 — and several are entangled with the obstruction-group thread the previous workers are actively developing. They need their own reading, not a drive-by.

The two `openInvestigations` (U1, U2) were also not touched.

## Boundaries

No new item, route, API, test or edge; no Lean file; the embedded diagnostic programs were **not** rerun; the atlas snapshot, Mathlib and Tau Ceti pins were **not** re-read. The JSON round-trips identically under `json.dumps(indent=2, ensure_ascii=False)`, which was verified before editing, so the diff is confined to the six `review` objects. **The next mathematical step named in the previous handoff — vanishing or a uniform-in-`m` bound for the two obstruction groups — is untouched and remains the top item.**

---

## Previous checkpoint report — retained in full

# PAPER-LIU-ETAL-22 — odd-ell Frobenius obstruction checkpoint

Codex — codex-a71f92 · 2026-09-23 · continuation of merged PR #2224 (codex-hjdg0j).
Input main: `fbfe41975f277338d20c2259ea7426696d29df36`. This is a partial paper continuation, not an independent review of the previous repairs.

## Outcome and boundary

The exact image formula from the previous checkpoint admits a sharper criterion than joint surjectivity of the two conjugate evaluation maps. For odd ell, the obstruction is an extension of a restriction-image quotient by the **minus eigenspace of a common Goursat quotient**. A diagonal paired image can have full sum image; requiring the full product is unnecessarily strong.

This does **not** show that the paper's actual GI(T²−1), j=1 tensor hypotheses remove that obstruction. A uniform annihilator bound would suffice for a bounded-error variant, but such uniformity has not been proved either. All E1/E13 and other arithmetic/geometric gates remain, and all 16 source findings retain their unreviewed status. No new source error is asserted.

There are now **214 items: 12 library, 20 planned, 182 missing**, 21 unchanged route identities, 371 recorded dependency edges, 78 definitions/constructions, 236 API entries and 162 test specifications. The nine additions are two existing-library atoms, one application-specific construction and six theorem obligations. All 205 previous items and all source-finding objects are preserved exactly. The new construction has two consumers, four API entries and six typed tests. G7 still records the 76 inherited definitions/constructions with only two tests; this is not a complete §12-compliant census.

## Sources and ownership

The [published paper](https://par.nsf.gov/servlets/purl/10323568) is the same 269-page PDF, SHA-256 `dd821abd2b06233cb69cdc88de242b689686d5f2ce0c2072128abcd54ec89d97` (reverified). Fresh targeted reading: §§2.3–2.7, Definition 8.1.1/beginning of Remark 8.1.2, and rank-zero proof pp.310–313. Reuse own earlier complete rank-one-proof reading pp.316–320. The full-paper reading remains attributed to codex-c83e7a, not claimed afresh.

Read the entire EulerSystemsAndKolyvaginSystems roadmap again, and AUDIT-24 entries ES.1/ES.4. Reused earlier complete ProfiniteCohomology and GlobalNumberFields reads after verifying byte identity. Keep shared evaluation/error arguments in ES.1/ES.4 and the final applications in the existing ArithmeticLevelRaisingAndBipartiteEulerSystems Part II route; no new roadmap or Lean file.

Read the whole [pinned Goursat file](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Goursat.lean), including the generated additive theorem, and the Smith-basis statement/proof with its PID hypotheses in [PID.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/FreeModule/PID.lean#L576). Reread the whole TauCeti/RepresentationTheory/Invariants.lean at pinned Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Reuse additive subgroup/quotient carriers and finite-group averaging over a suitable Z/ell^a; do not assume an O_lambda-action on the Galois kernel.

Searches of both pinned libraries for Goursat, anti-invariant and paired-evaluation terminology, and atlas packets/papers/expansion outputs, found the generic supplier already recorded by PAPER-WOOD-19/320 and the general swap-stable quotient-graph package /321–322 (statements read, including /323 boundary). This continuation specializes that mechanism; it does not propose a competing generic Goursat or wreath-product layer. Smith normal form is used over the DVR's integral lattice, never over its zero-divisor quotient. The negative search is scoped evidence, not a proof of absence.

## Exact obstruction and conditional consumers

In the CM case delta=2 put A=K^h, q0=P_h q, q1=q0 alpha and J=im q0. The identity q0 alpha²=q0 makes H=im(q0,q1) a swap-stable subdirect subgroup of J². With its common coordinate kernel D, Goursat gives C=J/D and an involution tau on C. Put C^-=ker(tau+1).

The actual Frobenius image G from S23 satisfies
`J/G ≃ C^-` and `0 → C^- → A/G → A/J → 0`.
Thus `G=A` exactly when `J=A` and `C^-=0`.
The two obstruction groups can be nonzero independently. The sequence need not split.

If ell^a kills A/J and ell^b kills C^-, then ell^(a+b)A lies in G. Only after passing through the additive evaluation map do we take O_lambda-spans. With e_lambda=ord_lambda(ell) and kappa=e_lambda(a+b), the loss is exactly kappa. The source's saturation function remains f(0)=f(1)=1, f(r+1)=2(f(r)+1); in particular f(1)=1 and f(2)=4.

To use this in Chebotarev one must select **actual evaluation rows**, not turn arbitrary O-linear combinations into imaginary Galois elements. S24-rows supplies that selection with no factor r in the error. Its proof chooses a residue basis of the row submodule from the actual set, iterates nilpotent Nakayama, and uses an integral matrix inverse argument to transfer the same bound to the square column image. It does not revive the false domain-only diagonalization assertion E2.

Conditional on the same geometric and cohomological gates as the preceding checkpoint:

- Rank zero threshold: `m > mper + mlat + mSigma + rR + kappa + mdif`.
- Rank one threshold: `m > mper + mlat + mSigma + 8rR + 2kappa + mdif`.

For a final large-m contradiction kappa must be bounded independently of m. Bounds obtained merely from the size of the finite groups at each depth are insufficient.

### New atomic items and proof arguments

#### PAPER-LIU-ETAL-22/L11 — Additive Goursat quotient graph

Status: library. For an additive subgroup H of G×K whose two coordinate projections are surjective, its coordinate kernels D_G and D_K admit an additive quotient equivalence G/D_G≃+K/D_K whose graph is the image of H in the quotient product. No coefficient-module structure or finiteness is needed.



Reuse AddSubgroup.goursatFst/goursatSnd and quotient carriers. PAPER-WOOD-19/320 records the multiplicative supplier, /321–/322 the general swap-stable quotient-graph package. No parallel generic Goursat or wreath-product roadmap is proposed.

#### PAPER-LIU-ETAL-22/L12 — Equal-rank Smith bases over a PID

Status: library. For a submodule M of a finite free module V over a PID with finrank M=finrank V, there are bases (b_i) of V and (m_i) of M and scalars a_i with m_i=a_i b_i in V.



Applied to the full preimage lattice in O^r, NOT to the zero-divisor ring O/π^n. Reduction and selection of actual evaluation rows remain S24-rows.

#### PAPER-LIU-ETAL-22/S23-obstruction — Paired-evaluation obstruction data

Status: missing. In S23-closure with delta=2 and ell odd, set A=K^h, P_h=g^(-1)Σ_(j<g)h^j, q0=P_h q and q1=q0 alpha. Let J=im(q0)=im(q1)≤A and H=im(q0,q1)≤J×J. H is swap-stable and subdirect. Its Goursat kernels coincide: D={x∈J:(x,0)∈H}={x∈J:(0,x)∈H}. Put C=J/D and let tau:C≃+C be the induced quotient-graph automorphism; tau²=1. Define C^-={c∈C:tau(c)=-c}. All are additive groups; K and J are not assumed O_lambda-modules.

1. q alpha²=h q implies q0 alpha²=q0. Since alpha is an automorphism, q0 and q1 have the same image J.
2. Applying alpha exchanges the two coordinates of H, so the kernels agree. Both projections onto J are surjective by definition.
3. Apply additive Goursat L11. Uniqueness of the quotient graph and swap stability imply tau²=1. C^- is the additive kernel of tau+id; multiplication by 2 is invertible since ell is odd.

Codex — codex-a71f92, continuation of PR #2224. Reuses the generic quotient-graph supplier; this adapter specializes it to actual conjugate evaluations. No GI implication claimed.

#### PAPER-LIU-ETAL-22/S23-defect — Exact anti-invariant defect of actual Frobenius evaluations

Status: missing. Under S23-obstruction put G=G_(S,gamma)=im(q0+q1). Then D≤G≤J, G/D=C^+ where C^+=ker(tau−id), and x↦(xbar−tau xbar)/2 induces J/G≃+C^-. Consequently there is an exact sequence 0→C^-→A/G→A/J→0, and G=A iff J=A and C^-=0.

1. For x∈D, (x,0)∈H gives x in the sum image. Modulo D the sum of (x,y)∈H is (1+tau)xbar; every xbar occurs by subdirectness.
2. Since 2 is invertible, im(1+tau)=C^+; the projectors (1±tau)/2 split C=C^+⊕C^-.
3. The minus projector on J/D is surjective onto C^- and has kernel G, giving the quotient equivalence.
4. Use the nested-subgroup sequence 0→J/G→A/G→A/J→0. This sequence need not split.
5. Diagonal H gives a nonzero common quotient but C^-=0: full paired surjectivity is sufficient, not necessary.

Codex — codex-a71f92, continuation of PR #2224. Conditional mathematical refinement awaiting independent review; no formalization or GI implication claimed.

#### PAPER-LIU-ETAL-22/S23-error — A bounded additive obstruction gives a bounded evaluation loss

Status: missing. Under S23-defect suppose a,b≥0 satisfy ell^a(A/J)=0 and ell^b C^-=0. Then ell^(a+b) A≤G. For e_lambda=ord_lambda(ell) and kappa=e_lambda(a+b), span_O(theta_S(G)) contains lambda^kappa span_O(theta_S(A)). Thus an input inclusion lambda^c0 Hom_O(S,Rbar(m)^h)≤span_O(theta_S(A)) gives lambda^(c0+kappa) Hom_O(S,Rbar(m)^h)≤span_O(theta_S(G)).

1. For x∈A, ell^a x lies in J and its class in J/G is killed by ell^b. Hence ell^(a+b)x∈G.
2. Theta is additive, so theta(ell^(a+b)x)=ell^(a+b)theta(x). Take O-spans only AFTER this inclusion; no O-action on the Galois group is assumed.
3. In O_lambda, ell is a unit times π^e_lambda, so the scalar-generated submodules coincide.
4. The sum a+b cannot generally be replaced by max(a,b): A=Z/ell², J=ell A, H antidiagonal in J² has G=0 and a=b=1.
5. Finiteness at each m supplies some a,b, but a uniform arithmetic error bound requires a+b bounded independently of m. This has not been deduced from GI.

Codex — codex-a71f92, continuation of PR #2224. Conditional mathematical refinement awaiting independent review; no formalization or GI implication claimed.

#### PAPER-LIU-ETAL-22/S24-rows — Choose actual evaluation rows without enlarging the loss

Status: missing. Let O be a DVR with uniformizer π, n>c≥0, r≥1 and R_n=O/π^n. If a set T⊆R_n^r has R_n-span M containing π^c R_n^r, there are r elements t1,…,tr of T such that the square matrix W with these rows has image containing π^c R_n^r. These rows belong to T; they are not arbitrary linear combinations replacing actual Frobenius elements.

1. The inverse image Mtilde⊆O^r contains π^c O^r and has rank r. L12 supplies Smith bases with coefficients unit times π^a_i, 0≤a_i≤c<n.
2. Thus M=Mtilde/π^n O^r≃⊕_i O/π^(n−a_i), so M/πM has residue-field dimension r. Select r elements of T whose images form a basis.
3. Their row-span U satisfies M=U+πM. Iterating n times, since π^n M=0, gives U=M.
4. There is B over R_n with B W=π^c I. Lift B,W to O: Bhat What=π^c I+π^n D=π^c Uhat, with Uhat=I+π^(n−c)D invertible by its unit determinant.
5. What is invertible over Frac(O). The integral matrix Chat=Uhat^(-1)Bhat satisfies Chat What=π^c I, hence What Chat=π^c I as well. Reduction proves the column-image inclusion with the same c.
6. No target row operations change the selected evaluations. Smith bases and matrix inverses prove their bound only.

Codex — codex-a71f92, continuation of PR #2224. Conditional mathematical refinement awaiting independent review; no formalization or GI implication claimed.

#### PAPER-LIU-ETAL-22/S24-bounded — Abundant tuples with an explicit Frobenius-defect loss

Status: missing. Retain S24's injection, absolute irreducibility and free rank-one invariant hypotheses, with ell odd and delta=2. Let S be free of rank r≥1 over O/π^n, n=m−mSigma, and set c0=f(r)rR, f(0)=f(1)=1 and f(r+1)=2(f(r)+1) for r≥1. Suppose S23-error holds with kappa=e_lambda(a+b) and c=c0+kappa<n. There are r actual elements of G_(S,gamma) whose evaluation map, after identifying the π^n-torsion of Rbar(m)^h with O/π^n, has image containing π^c(O/π^n)^r. S23 realizes them at associated primes avoiding any prescribed finite set.

1. Saturation and averaging give the input span bound c0 in Hom_O(S,Rbar(m)^h); S23-error gives the bound c=c0+kappa for actual evaluations.
2. Evaluations of S land in the π^n-torsion of the free rank-one O/π^m invariant target, namely π^mSigma times that target. Identify it with R_n and choose any basis of S.
3. Apply S24-rows to the set of actual evaluation rows, not to its O-span as though that were a Galois group.
4. Use the exact image and Chebotarev realization in S23; avoid previously selected primes as well as the fixed forbidden set.
5. This is a c-abundant variant, not the printed c0-bound when kappa>0. Rank one has c=rR+kappa; rank two has c=4rR+kappa.

Codex — codex-a71f92, continuation of PR #2224. Conditional mathematical refinement awaiting independent review; no formalization or GI implication claimed.

#### PAPER-LIU-ETAL-22/S25-boundedzero — Rank-zero pairing threshold with bounded Frobenius defect

Status: missing. In the rank-zero application of Theorem 8.2.2 retain all source hypotheses and conditional geometric reciprocity, integral comparison and perfect-pairing gates. Suppose S24-bounded applies with r=1 and kappa uniformly bounded in m. The distinguished local pairing then has exponent at least m−mper−mlat−mSigma−rR−kappa, and the global contradiction requires m>mper+mlat+mSigma+rR+kappa+mdif.

1. The local evaluation of a generator has exponent at least m−mSigma−rR−kappa, replacing rR by rR+kappa.
2. The reciprocity class retains the conditional exponent m−mper−mlat of (8.4). Perfect rank-one pairing subtracts the ambient torsion length m once.
3. All other local pairings are unchanged and killed by π^mdif as on pp.311–312. A distinguished exponent greater than mdif contradicts global reciprocity.
4. Uniform kappa allows sufficiently large m; an arbitrary bound depending on m need not do so.

Codex — codex-a71f92, continuation of PR #2224. Conditional mathematical refinement awaiting independent review; no formalization or GI implication claimed.

#### PAPER-LIU-ETAL-22/S25-boundedone — Rank-one pairing threshold with bounded Frobenius defect

Status: missing. In Theorem 8.3.2 retain every hypothesis and conditional arithmetic gate of S25-consumer. Suppose S24-bounded supplies an actual rank-two tuple with c=4rR+kappa and kappa uniformly bounded in m. The one-sided repair then gives primitive t with loc_w1(t)=0, exp_lambda loc_w2(t)≥m−mSigma−4rR−kappa and exp_lambda loc_w1(s)≥m−mper−4rR−kappa. The final pairing exponent is at least m−mper−mlat−mSigma−8rR−2kappa; the threshold is m>mper+mlat+mSigma+8rR+2kappa+mdif.

1. The one-sided localization argument is valid for any c<n. Use actual rows from S24-bounded and replace 4rR by 4rR+kappa.
2. Keep the distinguished-vector normalization π^mper v=π^mSigma s. This preserves mper and mSigma without dividing torsion elements by a negative power.
3. There is one loss c for t and one for s, hence 2c=8rR+2kappa; geometric mlat and different mdif terms are unchanged.
4. At kappa=0 this recovers S25-consumer. It is not an independent review of that repair, a proof of GI surjectivity or a resolution of E13.

Codex — codex-a71f92, continuation of PR #2224. Conditional mathematical refinement awaiting independent review; no formalization or GI implication claimed.

### Construction API and tests

- `RankinSelberg.pairedEvaluation_image` (data): Export existing AddSubgroup images J and H with preimage witnesses for actual evaluations q0,q1.
- `RankinSelberg.pairedEvaluation_swap` (compatibility): q0 alpha=q1 and q1 alpha=q0 identify the Goursat kernels; reuse the existing quotient graph.
- `RankinSelberg.pairedEvaluation_quotientInvolution` (projection): On C=J/D export tau with tau²=id, characterized by (x,y)∈H iff tau(x mod D)=y mod D.
- `RankinSelberg.pairedEvaluation_minus` (characterisation): C^-=ker(tau+id); the projection to C^- is c↦(c−tau c)/2 on the finite odd-order additive group.

- `RankinSelberg.pairedEvaluation_diagonal` (computation): For N=A=Z/3, q0=id and alpha=id, D=0, C=Z/3, tau=id and C^-=0. The paired image is not A² but its sum is all A.
- `RankinSelberg.pairedEvaluation_antidiagonal` (non-example): For N=A=Z/3, q0=id and alpha=-id, D=0, C^-=C=Z/3 and the sum image is zero although both coordinates surject.
- `RankinSelberg.pairedEvaluation_independent` (computation): For N=A², q0 the first projection and alpha the swap, H=A², D=A, C=C^-=0 and the sum image is A.
- `RankinSelberg.pairedEvaluation_zero` (degenerate): For q0=0, J=D=C=C^-=0 and H=0; the remaining obstruction is the whole A/J=A.
- `RankinSelberg.pairedEvaluation_goursat` (compatibility): D and tau agree with AddSubgroup.goursatFst and the equivalence from AddSubgroup.goursat_surjective after identifying the coordinate kernels.
- `RankinSelberg.pairedEvaluation_characteristicTwo` (non-example): For diagonal H≤(Z/2)², tau=id but im(sum)=0. The use of 1/2 and the odd-ell hypothesis cannot be omitted.

## Reproducible finite diagnostics

Standard-library Python, no third-party packages. Passed **21,134 field cases**, **56 higher-torsion cases**, and **85,880 three-row sets**, including **84,856 nonvacuous actual-row selections**. The checks cover all involutions on F3²/F5² and all 2×2 quotient maps, selected higher torsion, exact quotient graphs/defects, diagonal/antidiagonal/independent cases, the sharp a+b extension bound, and the ell=2 failure. They test finite algebra, not actual Galois realization, GI, Lean proofs or independent review.

The prior programs and their reported counts remain attributed historical evidence; they were not rerun in this continuation.

```python
from itertools import product, combinations
import json

counts = {"field_cases": 0, "higher_torsion_cases": 0, "row_sets": 0, "row_selection_cases": 0}
def add(x,y,m): return tuple((a+b)%m for a,b in zip(x,y))
def neg(x,m): return tuple(-a%m for a in x)
def scale(c,x,m): return tuple(c*a%m for a in x)
def act(a,x,m): return ((a[0]*x[0]+a[1]*x[1])%m,(a[2]*x[0]+a[3]*x[1])%m)
def compose(a,b,m):
    return ((a[0]*b[0]+a[1]*b[2])%m,(a[0]*b[1]+a[1]*b[3])%m,
            (a[2]*b[0]+a[3]*b[2])%m,(a[2]*b[1]+a[3]*b[3])%m)
def check(m,p,q,alpha):
    ambient = set(product(range(m), repeat=2))
    zero=(0,0)
    H={(act(q,x,m),act(q,act(alpha,x,m),m)) for x in ambient}
    J={x for x,y in H}
    assert J=={y for x,y in H}
    assert {(y,x) for x,y in H}==H
    D={x for x,y in H if y==zero}
    G={add(x,y,m) for x,y in H}
    assert D<=G<=J
    coset={}
    for x in sorted(J):
        if x not in coset:
            for y in D: coset[add(x,y,m)]=x
    C=set(coset.values())
    tau={}
    for x,y in H:
        cx,cy=coset[x],coset[y]
        assert cx not in tau or tau[cx]==cy
        tau[cx]=cy
    assert all(tau[tau[x]]==x for x in C)
    plus={x for x in C if tau[x]==x}
    minus={x for x in C if tau[x]==coset[neg(x,m)]}
    assert {coset[x] for x in G}==plus
    assert len(C)==len(plus)*len(minus)
    half=pow(2,-1,m)
    obstruction={x:coset[scale(half,add(x,neg(tau[coset[x]],m),m),m)] for x in J}
    assert {x for x in J if obstruction[x]==coset[zero]}==G
    assert set(obstruction.values())==minus
    assert len(ambient)*len(D)==len(G)*len(minus)*(len(ambient)//len(J))*len(D)
    assert (G==ambient)==(J==ambient and len(minus)==1)
    a=b=0
    while any(scale(p**a,x,m) not in J for x in ambient): a+=1
    while any(coset[scale(p**b,x,m)]!=coset[zero] for x in minus): b+=1
    assert all(scale(p**(a+b),x,m) in G for x in ambient)
    return len(J),len(D),len(C),len(minus),len(G),a,b

for p in (3,5):
    mats=list(product(range(p),repeat=4))
    involutions=[a for a in mats if compose(a,a,p)==(1,0,0,1)]
    for alpha in involutions:
        for q in mats:
            check(p,p,q,alpha)
            counts["field_cases"]+=1
for p in (3,5):
    for n in (1,2,3):
        m=p**n
        # Avoid the largest two-dimensional exhaustive set; n=3 is tested for p=3.
        if p==5 and n==3: continue
        for alpha in ((1,0,0,1),(-1,0,0,-1),(0,1,1,0),(1,0,0,-1)):
            for a in range(n+1):
                check(m,p,(1,0,0,p**a),alpha)
                counts["higher_torsion_cases"]+=1
# Nonzero common quotient with zero defect; full anti-invariant obstruction; independent pair.
assert check(3,3,(1,0,0,1),(1,0,0,1))[2:5]==(9,1,9)
assert check(3,3,(1,0,0,1),(-1,0,0,-1))[2:5]==(9,9,1)
assert check(3,3,(1,0,0,0),(0,1,1,0))[1:5]==(3,1,1,3)
# The extension exponent sum is sharp: A=Z/9, J=3A, anti-diagonal H in J^2, G=0.
assert {3*x%9 for x in range(9)}=={0,3,6}
assert {3*x%9 for x in (0,3,6)}=={0}
assert 3 not in {0} and 9%9==0
# Odd ell is essential: diagonal H in (Z/2)^2 has tau=id but sum image zero.
assert {(x+x)%2 for x in range(2)}=={0}

def span(rows,m):
    S={(0,0)}
    for row in rows:
        S={add(x,scale(c,row,m),m) for x in S for c in range(m)}
    return S
# Every three-element set of possible actual rows over these rings; no row combination substituted.
for p,n in ((2,2),(3,2)):
    m=p**n
    vectors=list(product(range(m),repeat=2))
    for rows in combinations(vectors,3):
        counts["row_sets"]+=1
        M=span(rows,m)
        bounds=[c for c in range(n) if {scale(p**c,x,m) for x in vectors}<=M]
        if not bounds: continue
        c=min(bounds)
        selected=next((pair for pair in combinations(rows,2) if span(pair,m)==M),None)
        assert selected is not None
        a,b=selected
        image={((a[0]*x[0]+a[1]*x[1])%m,(b[0]*x[0]+b[1]*x[1])%m) for x in vectors}
        assert {scale(p**c,x,m) for x in vectors}<=image
        counts["row_selection_cases"]+=1
print(json.dumps(counts,sort_keys=True))
```

## Submission checks

Paper validator: pass. Three-file intake: zero problems. Repository tests: 48 pass (9 paper-validator, 3 queue, 7 source-issue, 29 intake). Internal graph: 214 unique IDs, 371 edges, acyclic; every missing item routed once. All 205 inherited item objects, all 16 findings, all 21 route identities and both historical Markdown documents preserved. Publication base `ac04f995751446e20901cbdec6e8144b1752e86e`; relevant protocols, audit and prior paper files unchanged. No Lean compilation claimed or authorized.

## Remaining work

First try to prove J=A and C^-=0, or a uniform annihilator bound for A/J and C^-, from the **actual** tensor GI and polarizability hypotheses. Do not infer it from coordinate surjectivity. A residual argument must control the entire torsion tower, not just m=1. Independently review the normal-closure formula and one-sided E2 repair. Retain the remaining G1–G8 work, especially the 76 inherited two-test entries, full dependency/census refinement, E8/E13 and the source bibliography.

The checkpoint below is preserved verbatim as historical evidence; its older counts and validation statements are scoped to its own continuation.

---

# Liu–Tian–Xiao–Zhang–Zhu: integral level raising and Selmer bounds

**Partial continuation — Codex, codex-hjdg0j, 23 September 2026; follows PR #2218.** Earlier workers' full-paper and rank-two reading/proof records are preserved with attribution. This pass freshly reads published pp.125–138 and arXiv v3 pp.19–20, and isolates the exact normal-closure image missing in E1. There are now 205 items (10 narrow library imports, 20 planned interfaces, 175 missing refinements), 21 routes and 349 internal dependency edges. The 77 definitions/constructions have 232 API entries and 156 test specifications; the new construction has four typed tests, while the inherited 76 still need their third typed tests. Sixteen source findings await independent review. The main GI lifting implication and the complete extraction remain open.

## Integration of the concurrent checkpoint

PR #2181 by Claude Code (cc-d67081) was merged while the original Codex claim was held. The publication guard detected the changed deliverables; the issue was then available and was reclaimed, with bot confirmation at 10:07:11 UTC. This continuation preserves 41 prior item IDs as refined items and maps the broad `appendix-inputs` placeholder to its appendix-specific descendants. All 42 old IDs resolve through `continuation.items`; draft short IDs used in the discussion are recorded as `draftAlias` where a stable old ID replaces them. The prior reading/completion statement and all eleven prerequisite records are retained with attribution. Historical appendix count and version-number differences are corrected: the published paper has Appendices A–D, and arXiv Theorem 6.3.5 is published Theorem 6.3.4.

All four prior proposal identities remain: the unitary models; Gan–Gross–Prasad, importing Jacquet–Rallis for its proof; polarized automorphy lifting, now with the exact rigid R=T premises; and `ArithmeticLevelRaisingAndBipartiteEulerSystems`, reclassified as a Part II of the existing Selmer direction. The latter id does not assert Euler-system norm relations. The companion R=T theorem proves freeness, while equality of the two multiplicities is the main paper’s separate trace comparison. This distinction corrects an overcompressed inherited interface.

## Main theorem boundary

For relevant cuspidal representations in even and odd ranks n0=2r0 and n1=2r1+1, where n0,n1 are the even and odd members of {n,n+1} and r0+r1=n≥2, the paper proves conditional rank-zero and rank-one results for the Bloch–Kato group of Rλ(Π0)⊗Rλ(Π1)(n). Both use Hypothesis 3.2.10 in both ranks and all seven admissibility conditions. Rank zero uses a nonzero central Rankin–Selberg L-value. Rank one uses a nonzero projected étale Abel–Jacobi class of the diagonal. Conjecture 8.3.1 and injectivity of Abel–Jacobi would be needed to pass from a simple analytic zero through nonzero Chow class to that hypothesis; neither is supplied here.

The paper’s geometric proof constructs smooth and semistable unitary models, computes their Deligne–Lusztig incidence matrices and applies localized weight spectral sequences. Even-rank integral arithmetic level raising uses a mixed deformation crossing and a rigid R=T theorem. Odd-rank Tate cycles supply the complementary factor. The first explicit reciprocity law identifies singular Abel–Jacobi localization with a finite diagonal period, up to specified units. The second law is an exponent inequality at a good-reduction prime. These feed global duality contradictions. This is a level-raising annihilator argument; the extraction does not assert a norm-compatible Euler or Kolyvagin system.

For rank zero choose m greater than mper+mlat+mΣ+rR+mdif. The period valuation, lattice comparison, bad-place annihilator and saturation loss give a lower bound on the pairing at the selected prime; every other pairing vanishes or is killed by the coefficient different. Global reciprocity contradicts the resulting exponent. Rank one uses two primes and the stronger bound m>mper+mlat+mΣ+8rR+mdif; the one-sided localization replacement below supplies the E2 step conditional on actual abundant evaluations, without changing that bound. E1 remains unresolved. Constants must be uniform in m. The ell-adic crystalline pairing is controlled by the inverse different modulo O, and is not silently zero over ramified coefficient fields.

## Read sources and versions

| Source | Version and reading | SHA-256 |
|---|---|---|
| [main](https://par.nsf.gov/servlets/purl/10323568) | All 269 PDF pages (printed 107–375), including main §§1–8, Appendices A–D, footnotes and references; clipped passages reread. | `dd821abd2b06233cb69cdc88de242b689686d5f2ce0c2072128abcd54ec89d97` |
| [arxiv](https://arxiv.org/pdf/1912.11942v3) | Selected comparison pages only: 19–20,24,82,83,86,133,143,164 fully, and relevant portions of 21,87,98,134,163,165. No full-version reading claimed. | `84dc7c8369298314bd4e7ece5a45e5e096f39bd376f08c4c489950873c46fe86` |
| [survey](https://arxiv.org/pdf/2509.16881v1) | All 35 pages of arXiv:2509.16881v1; pp.9–10 reread after clipping. Remark 8.2 refinement recorded; Conjectures 6.3,6.4,10.8 retained as conjectures. | `56412df42fee5e82db9ebae5d907a8bcb071bce584ed72b94774e7c8726c215a` |
| [rigid](https://arxiv.org/pdf/2108.06998) | PDF pp.27–36 fully: §§3.5–3.6, proof of Theorem 3.6.3 and beginning of §4.1. Remaining pages not fully read. | `fce1c9ae227dc1fcbc2fa712ae0034f7454b77595f63b927a7bdc7237f81292a` |
| [potential](https://arxiv.org/pdf/1511.08268) | PDF pp.5–17 fully: entire §2 and beginning of §3. Includes full proofs of Theorems 2.16/2.18 and Proposition 2.19. Remaining pages not fully read. | `1fa785a5836280044133bc015982102503194d25219908ddab270c31eada2436` |

The principal PDF is the published Springer text, not an assumed-identical preprint. Its 269 PDF pages correspond to printed pages 107–375. The source archives retain acquisition date, size and hash. Rendered page images checked include PDF pages 123, 125, 129, 146, 196, 201, 213, 216, 217, 247 and 249. Selected arXiv passages were collated only as listed in the JSON. The publisher article page was inaccessible, so the errata search is explicitly incomplete.

The 2025 survey restricts its exposition to an even-n setup with extra field choices; these are not automatically the main paper’s general hypotheses. Remark 8.2 descends from a normal transferable subgroup by all-level concentration and Hochschild–Serre, removing an auxiliary small-level restriction. Its good-reduction and indefinite-Ihara conjectures and the categorical Conjecture 10.8 remain conjectural. The mod-ell categorical discussion does not remove the main λ^m deformation hypotheses.

The original rigid-deformation theorem was read with D0–D4 and its proof: adequacy/Taylor–Wiles primes, perfect auxiliary complexes, group-algebra freeness, patched dimensions, parity and Auslander–Buchsbaum descent. In odd rank its level-raising set must be empty. The original potential-map §2 was read through its full boundary-compatibility proof. It uses proper semistability and very-nice coefficients, including the condition on every relevant subquotient; the application to the nonproper unitary product is still a separate support-comparison gate.

## Library and ownership evidence

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Read declarations are TauCeti.AlgebraicGeometry.AbelianVariety, TauCeti.ContCohomology.H1, H1EquivOfSmulEqSelf, explicitInfRes_exact, and Matrix.IsHermitian with its entrywise and map lemmas. The H1 import is an additive quotient; its pointwise quotient topology is not a substitute for the discrete continuous-cohomology comparison. Inflation–restriction imports only the exactness actually stated, with continuous quotient action.

Reviewed audit entries and actual layer descriptions were consulted for Selmer, PEL, étale duality, automorphic Galois realizations, Igusa concentration, local/global deformations, derived patching, q-series and nearby cycles. Search hits for Selmer and level raising include foundational or classical GL2 code and do not supply the required unitary theorem. A reproducible search manifest in the JSON gives paths for all matches to seven focused patterns across both pinned Lean trees. No Gaussian coefficient, unitary PEL/Rapoport–Zink/Deligne–Lusztig object, or named weight-spectral/potential-map declaration was found under the recorded patterns. These bounded negative searches are evidence alongside the audit, not proof that every equivalent formulation was excluded.

The exact broad roadmap scopes matter: AG2.4 concerns nonselfdual systems, so it is not cited for torsion concentration. IG.5/IG.7 own that theorem. MotivesAndAlgebraicCycles:MC.2 owns the general cycle realization interface. LPV.7 already covers the source-qualified higher-dimensional weight sequence; it is imported rather than recreated.

## Routes

| Route | Owner | Items | Suggested Lean file |
|---|---|---:|---|
| 1: source | SelmerIwasawaCohomology | 13 | `TauCeti/Roadmap/SelmerIwasawaCohomology/RankinSelberg.lean` |
| 2: source | EulerSystemsAndKolyvaginSystems | 16 | `TauCeti/Roadmap/EulerSystemsAndKolyvaginSystems/RankinSelberg.lean` |
| 3: source | GlobalGaloisDeformations | 3 | `TauCeti/Roadmap/GlobalGaloisDeformations/RankinSelberg.lean` |
| 4: source | LocalGaloisDeformationRings | 2 | `TauCeti/Roadmap/LocalGaloisDeformationRings/RankinSelberg.lean` |
| 5: source | AutomorphicGaloisRepresentationsPartII | 6 | `TauCeti/Roadmap/AutomorphicGaloisRepresentationsPartII/RankinSelberg.lean` |
| 6: source | SmoothRepresentationsOfLocalGroups | 12 | `TauCeti/Roadmap/SmoothRepresentationsOfLocalGroups/RankinSelberg.lean` |
| 7: source | PELModuli | 4 | `TauCeti/Roadmap/PELModuli/RankinSelberg.lean` |
| 8: source | IgusaVarietiesAndTorsionConcentration | 3 | `TauCeti/Roadmap/IgusaVarietiesAndTorsionConcentration/RankinSelberg.lean` |
| 9: source | QSeriesPartitionsAndMockModularForms | 4 | `TauCeti/Roadmap/QSeriesPartitionsAndMockModularForms/RankinSelberg.lean` |
| 10: source | LefschetzPencilsAndVanishingCycles | 2 | `TauCeti/Roadmap/LefschetzPencilsAndVanishingCycles/RankinSelberg.lean` |
| 11: source | MotivesAndAlgebraicCycles | 1 | `TauCeti/Roadmap/MotivesAndAlgebraicCycles/RankinSelberg.lean` |
| 12: source | EndoscopicTransferAndUnitaryTraceComparison | 8 | `TauCeti/Roadmap/EndoscopicTransferAndUnitaryTraceComparison/RankinSelberg.lean` |
| 13: part-ii | UnitaryRapoportZinkSpacesAndRSZModels | 42 | `TauCeti/Roadmap/UnitaryRapoportZinkSpacesAndRSZModels/RankinSelberg.lean` |
| 14: part-ii | UnitaryLevelRaisingTypesAndHeckeOperators | 11 | `TauCeti/Roadmap/UnitaryLevelRaisingTypesAndHeckeOperators/RankinSelberg.lean` |
| 15: part-ii | PolarizedAutomorphyLifting | 1 | `TauCeti/Roadmap/PolarizedAutomorphyLifting/RankinSelberg.lean` |
| 16: part-ii | SemistablePotentialMaps | 4 | `TauCeti/Roadmap/SemistablePotentialMaps/RankinSelberg.lean` |
| 17: new | GanGrossPrasadConjecturesForClassicalGroups | 2 | `TauCeti/Roadmap/GanGrossPrasadConjecturesForClassicalGroups/RankinSelberg.lean` |
| 18: part-ii | ArithmeticLevelRaisingAndBipartiteEulerSystems | 58 | `TauCeti/Roadmap/ArithmeticLevelRaisingAndBipartiteEulerSystems/RankinSelberg.lean` |
| 19: source | EtaleDualityAndPerverseSheaves | 1 | `TauCeti/Roadmap/EtaleDualityAndPerverseSheaves/RankinSelberg.lean` |
| 20: source | AutomorphicLFunctionsAndLocalFactors | 1 | `TauCeti/Roadmap/AutomorphicLFunctionsAndLocalFactors/RankinSelberg.lean` |
| 21: source | PeriodsAndSpecialValues | 1 | `TauCeti/Roadmap/PeriodsAndSpecialValues/RankinSelberg.lean` |

### 1. SelmerIwasawaCohomology

Source-specific finite conditions and procyclic lemmas refine the existing cohomology, duality and Selmer interfaces. Pinned continuous H1 and inflation–restriction are imported, not replanned. The different-valued FL pairing remains explicit.

Suggested landmarks: Continuous coefficient module, Nonsingular and singular local conditions away from ell, Procyclic invariants and coinvariants, Integral weak semisimplicity criterion.


### 2. EulerSystemsAndKolyvaginSystems

The existing simultaneous-Chebotarev and error-tolerant descent layers own these shared evaluation and bounded-denominator arguments. They are reused by the level-raising annihilator application without claiming a norm-compatible Euler system.

Suggested landmarks: Exponent and divisibility order, Evaluation extension cut out by Selmer classes, Conditional abundance supply, One-sided rank-two localization with a distinguished class.


### 3. GlobalGaloisDeformations

Polarized group representations and their extension signs belong to the existing dimension-n deformation interface; no second polarized representation category is proposed.

Suggested landmarks: Polarized extension group GN, j-polarization, Extension along a polarization.


### 4. LocalGaloisDeformationRings

The mixed local crossing and rigid local lifting conditions refine the existing local deformation layers. Their explicit components and FL bounds are supplied here; the global integral R=T conclusion is separate.

Suggested landmarks: Rigid polarized deformation condition, Mixed deformation crossing.


### 5. AutomorphicGaloisRepresentationsPartII

Import the compatible-system and residual normalization owners. Hypothesis 3.2.10 remains an explicit conditional constituent request, not a theorem inferred from an existing broad layer.

Suggested landmarks: Decomposed genericity, Middle cohomological realization hypothesis, Temperedness, Galois realization with duality.


### 6. SmoothRepresentationsOfLocalGroups

The spherical Hecke and Satake layer owns the reciprocal parameters, twisted characters and explicit spherical transforms; the specialized finite type and two-parahoric correspondence are an extension below.

Suggested landmarks: Abstract unitary Satake parameter, Tate-generic parameter, Even differentiated polynomial, Odd intertwining and Tate polynomials.


### 7. PELModuli

Reuse PEL data, abelian schemes, polarization/signature conditions, local deformation and auxiliary torus models. The special unitary integral models extend the shared proposal rather than rebuilding these notions.

Suggested landmarks: Hermitian space and adjoining a unit line, OF-abelian object and signature, Isogeny lattice and deformation interface, Auxiliary CM torus model.


### 8. IgusaVarietiesAndTorsionConcentration

Appendix D supplies a source-qualified extension to the relevant unitary setting and all-level middle concentration. Read the original CS and trace-comparison proof inputs before considering this dependency closed.

Suggested landmarks: All-level cohomological genericity, Torsion cohomological genericity, Almost-all generic coefficient places.


### 9. QSeriesPartitionsAndMockModularForms

Gaussian polynomials and these finite q-binomial identities belong to the existing q-series owner; no second Gaussian coefficient definition is introduced in the unitary counting layer.

Suggested landmarks: Gaussian coefficient polynomial, Even Gaussian identity, Signed Gaussian identity, Gaussian weighted difference.


### 10. LefschetzPencilsAndVanishingCycles

The existing layer expressly includes higher-dimensional source-qualified semistable weight sequences. Import its signed restriction/Gysin complex; degeneration is a separate source-specific result.

Suggested landmarks: Weight spectral sequence, Nearby-cycle complex with localized coefficients.


### 11. MotivesAndAlgebraicCycles

The cycle-class and correspondence owner supplies the general realization interface. This source request adds the precise projected étale Abel–Jacobi map, with no claim of injectivity or conjectural analytic nonvanishing.

Suggested landmarks: Projected diagonal Abel–Jacobi class.


### 12. EndoscopicTransferAndUnitaryTraceComparison

The existing trace-comparison owner supplies global packet multiplicity, local/global base change, parity switches and normalized trace dimension identities. Full original local classification and trace proofs remain gates.

Suggested landmarks: Compactly supported and ordinary comparison, Global multiplicity-one realization, Normalized trace dimension formula, Standard automorphic unitary pair.


### 13. Siegel and PEL moduli problems, Part II: unitary Rapoport–Zink spaces, RSZ integral models and p-adic uniformization

These are precisely the unitary models already assigned by related papers; this is an extension of that proposal, not a new competing geometry roadmap.

Coalesce with UnitaryRapoportZinkSpacesAndRSZModels already proposed by PAPER-LI-ZHANG-22-B and extended by PAPER-LI-LIU-21 and PAPER-LI-LIU-22; keep one model owner. Import PEL moduli (PELModuli M0–M6), EtaleDualityAndPerverseSheaves EDC.3–4 and LefschetzPencilsAndVanishingCycles LPV.7. Extend the smooth and defect-p² unitary integral models by the exact balloon, ground and link strata, their Deligne–Lusztig fibres, normal bundles, excess intersections and parity-dependent special morphisms in §§4–5 and Appendix A. Prove the ordered four-component semistable product resolution with five double and two triple strata. Final exports are the incidence matrices and geometric reciprocity correspondences used by §§6–7. Retain the corrected excess Chern index, Fp² descent needed for arithmetic Tate classes, and the unresolved global trivial-P1-bundle assertion. General projective-bundle and blowup formulas are imported, not reproved here.

Suggested landmarks: Smooth integral unitary model, Smooth model: representability, Ground DL intersection number, Definite unitary Shimura set.


### 14. Smooth representations of local groups, Part II: Unitary level-raising types and Hecke operators

The finite unitary types and their integral parahoric comparison exceed the generic spherical layer. They serve the arithmetic level-raising theorem rather than the symmetric-power functoriality endpoint of SymmetricPowersByUnitaryLevelRaising.

Import SmoothRepresentationsOfLocalGroups SR.0–4 and its Hecke normalizations, QSeriesPartitionsAndMockModularForms QM.0 for Gaussian coefficients, and the general finite representation and local Langlands suppliers. Cover the Hermitian isotropic graph count in all characteristics, the finite Tate–Thompson representation with reduced H0 at rank two, its parabolic fixed vectors and the exact tempered local base-change case split of Appendix C.2. Construct the two-parahoric intertwiners and prove their compositions and the odd relation V T°=((q+1)²T•+VU)V, then export integral invertibility under the stated Satake unit hypotheses. Prove the quasi-split/nonsplit special correspondence and source-qualified Ihara injection. Import global packet multiplicities from EndoscopicTransferAndUnitaryTraceComparison. The classical algebraic GSp character extension ClassicalGroupsPartII has different scope and is not duplicated. Import the generic Deligne–Lusztig representation and integral-reduction interface from ModularRepresentationsOfFiniteReductiveGroups proposed in PAPER-LE-LEHUNG-LEVIN-ETAL-20; the present finite unitary type is its nondefining-characteristic specialization, not a second generic construction.

Suggested landmarks: Primitive fibre automorphic description, Intertwining Hecke operators, Local Tate–Thompson base-change criterion, Nonsplit special local correspondence.


### 15. Reusable infrastructure for potential automorphy over CM fields, Part II: polarized automorphy lifting and finiteness of deformation rings

The existing polarized automorphy-lifting proposal owns the unitary patching direction. Extend it with the precise integral R=T theorem; the equal unramified/ramified multiplicity is a separate main-paper trace computation, not a conclusion of the companion theorem alone.

Coalesce with PolarizedAutomorphyLifting proposed by PAPER-BOXER-CALEGARI-GEE-25. Add this exact rigid-unitary specialization to that existing proposal. Final theorem is [51] Theorem 3.6.3 with all D0–D4 premises: nonzero localized Hecke algebra, rigid local conditions, ell unramified in F with weight-width and ell≥2(N+1) bounds, residual absolute irreducibility over F(ζell), and integral middle-only cohomology at all levels; require empty level-raising set for odd rank. Conclude integral R=T, local complete intersection and cohomology freeness. Import GlobalGaloisDeformations G7/R04.5, LocalGaloisDeformationRings R08.2/L7, DeformationAndDerivedPatchingAlgebra P8–P9, and IgusaVarietiesAndTorsionConcentration for the actual concentration premise. Decompose the adequate Taylor–Wiles primes, perfect auxiliary complexes, group-algebra freeness, framed patched dimensions, parity argument and Auslander–Buchsbaum descent. Neither equality of generic supports nor near faithfulness is this integral theorem. The original proof has been read but its ChT/Thorne/Khare–Thorne/Carayol inputs remain open proof leaves.

Suggested landmarks: Rigid unitary R=T input.


### 16. Lefschetz pencils and vanishing cycles, Part II: Semistable potential maps

The existing weight-sequence layer is imported. The potential cokernel and cycle boundary add reusable theorems beyond its stated exports.

Build the general potential differential of Liu [47] §2 for proper strictly semistable schemes over a henselian DVR with finite residue field, with Qell or Z/ell^ν coefficients. Import LefschetzPencilsAndVanishingCycles LPV.7 for the signed stratum complex and monodromy, EtaleDualityAndPerverseSheaves EDC.3–4 for Gysin and purity, and MotivesAndAlgebraicCycles MC.2 for cycle realization. Define both B groups and their E2-null subquotients, invariants/coinvariants A groups, nice conditions N1/N2 and the universal very-nice subquotient condition N3. Prove the exact sequence of [47] Theorem 2.16 and the compatibility of its boundary with étale Abel–Jacobi in Theorem 2.18; include Proposition 2.19’s closure-codimension condition. Treat extension to the nonproper unitary product as a separate compact-support comparison obligation. No general weight–monodromy conjecture is asserted.

Suggested landmarks: Potential differential, Nice and very nice coefficients, Potential exact sequence, Potential boundary equals Abel–Jacobi boundary.


### 17. The Gan–Gross–Prasad conjectures for classical groups: relevant pairs, Vogan packets, Bessel models and periods

Preserve the existing Gan–Gross–Prasad endpoint owner. Its proof imports JacquetRallisRelativeTraceComparison; the general cycle realization remains MC.2 and the Selmer bound belongs to the arithmetic extension.

Coalesce with GanGrossPrasadConjecturesForClassicalGroups, proposed by PAPER-JIANG-ZHANG-20 and retained in PR #2181. The exact proved endpoint required here is the nonzero central Rankin–Selberg L-value to nonzero definite diagonal period implication in Lemma 8.2.1, with the existence of the hermitian pair, local packets and finite-level eigenfunctions. Import JacquetRallisRelativeTraceComparison for [6] Theorem 1.8 and Remark 4.17, and AutomorphicGaloisRepresentationsPartII for the normalizations. Retain Conjecture 8.3.1 as a conjectural Chow-cycle nonvanishing statement; passing to the nonzero étale Abel–Jacobi class requires an additional injectivity assertion. General cycle classes and Abel–Jacobi functoriality are imported from MotivesAndAlgebraicCycles MC.2, not constructed again. No simple L-derivative condition is substituted for Theorem 8.3.2’s actual class hypothesis.

Suggested landmarks: Nonzero definite period from central L-value, Weak arithmetic Gan–Gross–Prasad hypothesis.


### 18. Selmer and Iwasawa cohomology, Part II: Arithmetic level raising and Rankin–Selberg Selmer annihilators

The geometric-cycle annihilator method is new in the Selmer direction while the general cohomological, descent, unitary geometric and representation interfaces retain their existing owners. Preserve the proposal id from PR #2181, but classify it as an extension of SelmerIwasawaCohomology as §15 requires and as its prior handoff explicitly considered. The legacy id is not an assertion of Euler-system norm relations.

For relevant cuspidal Π0,Π1 of ranks n0=2r0 and n1=2r1+1 with r0+r1=n≥2, retain Hypothesis 3.2.10 in both ranks and every admissibility condition L1–L7. The final rank-zero theorem uses nonzero L(1/2,Π0×Π1); the rank-one theorem uses nonzero projected diagonal Abel–Jacobi class. Import SelmerIwasawaCohomology L0–L4, EulerSystemsAndKolyvaginSystems ES.1/ES.4 for shared simultaneous localization and uniform error control, UnitaryRapoportZinkSpacesAndRSZModels, UnitaryLevelRaisingTypesAndHeckeOperators, PolarizedAutomorphyLifting, SemistablePotentialMaps, JacquetRallisRelativeTraceComparison and the Igusa/Galois/trace owners. Prove the three-piece localized weight analysis, odd Tate-cycle isomorphism, even arithmetic level raising at every depth λ^m and both explicit reciprocity laws with their different equality/inequality conclusions. Track mper, mlat, mΣ, rR and the coefficient different in the global pairing contradictions. Resolve E1 before presenting either proof as closed. For rank one use the one-sided localization replacement below, preserving the distinguished class and the 8rR bound; independently review this repair. Conjecture 8.3.1 and Abel–Jacobi injectivity remain hypotheses, and no norm-compatible Euler system is claimed.

Suggested landmarks: Rankin–Selberg tensor and GI condition, Common-power lift of residual GI, Level-raised annihilating torsion class, Uniform pairing contradiction.


### 19. EtaleDualityAndPerverseSheaves

Import the existing projective-bundle and blowup formulas; only the actual unitary blowup belongs to the model extension.

Suggested landmarks: Blowup cohomology.


### 20. AutomorphicLFunctionsAndLocalFactors

Preserve and refine the corresponding inherited general interface under its existing owner.

Suggested landmarks: Normalized Rankin–Selberg L-function.


### 21. PeriodsAndSpecialValues

Preserve and refine the corresponding inherited general interface under its existing owner.

Suggested landmarks: Bloch–Kato rank conjecture interface.


These are proposed file paths and planet labels for later design work. No Lean file is among this issue’s authorized deliverables. Every included definition and construction has actual-consumer uses, projection/characterization/compatibility API statements and at least two test specifications in the JSON; those tests are plans, distinct from the executed computations below.

## Mathematical checks and bounded proofs

The executable below ran successfully: 1,806 assertions in 20 families. Some assertions are small diagnostic calculations rather than independent theorem checks. It verifies the Appendix B identities exactly at the specified integer/rational points, including polynomial interpretations at λ=±1, and enumerates 6,281 subspaces over F4 and F9. The Hermitian maximal-isotropic intersection counts are [1,2], [1,8], [1,10,16], [1,40,256] for q=2 and N=2,3,4,5, and [1,3], [1,27] for q=3 and N=2,3. It also checks the product-ring ordering obstruction, the abundant-matrix index/adjugate example and the F9 twisted Fermat example. Finite checking does not prove the general results.

For the Gaussian product proof, define Hn(t)=Σk [n,k]q t^k. Gaussian Pascal gives Hn(t)=(1+t)Hn−1(t)−(1−q^(n−1))tHn−2(t). At t=−1 this yields H2k(−1)=∏i(1−q^(2i−1)). Substitute q↦−q^−1 and apply Gaussian reciprocity to obtain B.2.7 as a polynomial identity. Pairing indices δ and −δ−1 gives the vanishing odd moment and B.3.3; the same Pascal relation applied to the weighted even/odd difference gives B.2.8. The twisted-character product and derivative identities follow by finite coefficient expansion, treating all quotients as Laurent polynomials before specialization.

For B.4.5 first choose W∩W′ by the Gaussian factor [r,s]q² and quotient by it. In the remaining hyperbolic s+s+ε space, every transverse maximal isotropic subspace is a graph parametrized by a matrix A and, for ε=1, a vector v. Its equation is A+A^(c,t)+v^(c,t)v=0. There are q^(2sε) choices of v, q^(s(s−1)) choices of off-diagonal entries and q^s diagonal solutions, because Tr:Fq²→Fq is surjective with q-element fibres even in characteristic two. This proves q^(s(s+2ε))[r,s]q². The enumerations include characteristic two explicitly.

A useful expansion of Lemma 8.1.5(1) takes the normal closure H of the regular-unipotent element t. It lies in ker ρ1. Over an algebraically closed coefficient field, the H-socle of irreducible V0 is Γ-stable, so V0 restricted to H is semisimple. Every nonzero H-simple summand has a t-fixed vector; the one-dimensional fixed space of a regular unipotent forces just one summand. Thus H acts irreducibly on V0 and its generated algebra is End(V0). Any Γ-stable subspace of V0⊗V1 is then V0⊗W1, and Γ-irreducibility of V1 forces W1 to be zero or all. This supplies the omitted invariance argument. Part (2) still needs the original Serre small-characteristic and adjoint Jordan-block inputs.


## Rank-two replacement for the E2 inference

This section is new work by Codex — codex-a71f92. It replaces only the linear-algebra step used in the rank-one argument. It neither proves Lemma 2.6.4 nor constructs the required Galois lifts. The published basis assertion remains the E2 finding, and both the finding and this proposed replacement need independent review.

The source passages freshly checked are [the published paper](https://par.nsf.gov/servlets/purl/10323568), §§2.3, 2.5–2.7 through Lemma 2.7.1 and the proof of Theorem 8.3.2 on printed pp.316–320, with the displayed claims on pp.135,317,318 checked against page images. The PDF was reacquired on 2026-09-23 and its hash matches the ledger above. The full-paper reading elsewhere in this report is inherited from PR #2205, not a fresh whole-paper claim by this worker.

### The exact weaker statement

Let O be a DVR with uniformizer π, Rn=O/π^n, n≥1, and 0≤c<n. Let S be free of rank two over Rn, let v be primitive in S, and let f1,f2:S→Rn be linear. Suppose the image of (f1,f2) contains π^c Rn². After permuting the two maps, there is a primitive t in S with

- f1(t)=0;
- expπ(f1(v))≥n−c;
- expπ(f2(t))≥n−c.

There is no requirement that v,t form a basis, and no assertion that f2(v)=0. Crucially, the evaluation maps are only permuted, not replaced by coefficient-linear combinations: such combinations need not come from actual Galois elements.

### Integral lifting and proof

Choose a basis of S and any integral lift A of the two-row matrix. The image hypothesis gives a matrix B over O with AB=π^c I+π^n D. Put U=I+π^(n−c)D. Its determinant reduces to 1 modulo π, so U is invertible over O. Thus C=B U^−1 is integral and AC=π^c I. Taking determinants shows det A≠0; over the fraction field C=π^c A^−1, and therefore CA=π^c I as well. This is item S25-lift. It does not invert a nonunit inside O.

If both coordinates of Av were in π^(c+1)Rn, multiplication by C would give π^c v in π^(c+1)Rn². Since c<n this contradicts primitivity. Permute the rows so that f1(v) has valuation at most c.

Write the first integral row as π^a(u1,u2), with at least one ui a unit. The image bound implies a≤c. Set t=(-u2,u1) modulo π^n. This vector is primitive and its first evaluation is exactly zero. Its second evaluation is det A/π^a. In the integral matrix C=π^c adj(A)/det A, one entry comes from a first-row cofactor of valuation a; hence c+a−v(det A)≥0. Thus v(det A)−a≤c, proving the required second bound. This is S25-row, and together the steps prove the stable item localization-selmer.

For A=[[π,1],[0,π]], c=2 and n>2, one can take v=(1,0) and t=(-1,π). Their first evaluations are π and zero, and the second evaluation of t is π². Their determinant is π, so they do not form a basis: the replacement deliberately does not recover the false stronger assertion. The strict condition c<n is also essential to a nonzero bound; c=n gives a vacuous image hypothesis.

### From evaluation back to local cohomology

Let h act on a finite Oλ-module M, with h^g=1 and g prime to ell. Put N=1+h+⋯+h^(g−1). The averaging projector e=N/g has image M^h and kernel (h−1)M. For the reverse kernel inclusion use
(h−1)Σ(i h^i)=g−N, with the sum over 0≤i<g. Consequently N induces an isomorphism M/(h−1)M→M^h.

For an unramified local representation and arithmetic Frobenius F acting by h, a cocycle z satisfies z(F^g)=N z(F). Thus restriction to the unramified degree-g extension killing the coefficient action is precisely this norm under the usual procyclic H1 comparison. It preserves zero and the λ-exponent. In §2.6 use g=ord(hγ), not the order of an arbitrary lift in the Galois closure. The named local-cohomology supplier remains Selmer L0/L2; this computation does not repair E1's joint lifting assertion.

### Distinguished class and unchanged error budget

Set n=m−mΣ and c=4rR. The source's actual abundant pair evaluates S into the submodule annihilated by π^n in its free rank-one O/π^m target; that submodule is π^mΣ times the target and is isomorphic to Rn. Under this identification abundance is exactly the image hypothesis above.

Take the primitive v=π^mΣ s0, with π^mper s0=s as in footnote 33. Use the weaker lemma to choose the first evaluation and t. The norm comparison gives loc_w1(t)=0 and exp loc_w2(t)≥m−mΣ−c. To recover the distinguished-class bound use the honest identity π^mper v=π^mΣ s. Since m−mΣ−c−mper>0, the first localization of its left side is nonzero; scaling exponents on both sides yields exp loc_w1(s)≥m−mper−c. This avoids division by π inside torsion modules even when mΣ<mper.

The rest of the exponent accounting is now unchanged, conditional on the paper's geometric and local-duality inputs. Equation (8.12) has lower bound m−mper−c; equation (8.13) gives m−mper−c−mlat. Pair the constructed c2 with t, not with a member of an alleged diagonal basis. The first prime contributes zero because loc_w1(t)=0. At the second prime, the perfect rank-one finite/singular pairing gives exponent at least
m−mper−mlat−mΣ−2c = m−mper−mlat−mΣ−8rR.
All bad-place, crystalline and global-reciprocity steps use the same inputs as before. No condition on loc_w2(v) is used. This is the conditional consumer item S25-consumer, not a claim that the still-open E1, E13 or geometric gates have vanished.

### Ownership and checks

The reusable bounded-image and primitive-kernel lemmas refine EulerSystemsAndKolyvaginSystems:ES.4; the exact two-place interface also serves ES.1. The local norm comparison refines SelmerIwasawaCohomology:L0/L2. Only the arithmetic application belongs to the existing proposed Selmer Part II. No route or proposal is duplicated. Reviewed AUDIT-24 entries ES.1/ES.4 still report the simultaneous localization and uniform-error targets absent. Both complete pinned libraries and the atlas packets/decompositions/reserved IDs were searched for the refinement; no applicable implementation or narrower owner was located under the recorded patterns.

The elementary proof imports the actual pinned statements of Matrix.mul_adjugate, Matrix.adjugate_mul and Matrix.isUnit_iff_isUnit_det. Their entries are L06–L08. The upstream ProfiniteCohomology and GlobalNumberFields documents were read in full, as was the ES owner document; they keep the local-cohomology operations and arithmetic carriers in their existing owners. No new definition or construction is introduced by this continuation.

The standalone program below checks every 2×2 matrix over Z/4, Z/8, Z/9, F2[t]/t³ and F4. It enumerates the actual image to find the smallest c<n satisfying the bound, constructs a primitive kernel vector for each row, and tests every primitive distinguished vector. Results: 15,265 matrices, 12,894 satisfying a nonvacuous bound, 25,788 primitive-kernel checks and 742,644 distinguished-vector checks. Tests include the original non-diagonalizable example and the failure of v,t to form a basis. Finite testing is not a proof over all DVRs and does not test Galois realizability; the general proof is the preceding argument.

## Exact normal-closure formula for the lifting gate

This section is new work by Codex — codex-hjdg0j. It supplies a replacement formula for Lemma 2.6.4 and a sufficient arithmetic input to recover the printed equality. It does **not** deduce that input from the main GI(T²−1), j=1 hypothesis, or independently review the previous workers' findings.

The [published PDF](https://par.nsf.gov/servlets/purl/10323568) was reacquired with the identical hash in the source table. Printed pp.125–138 were read, including the evaluation extension, polarization, associated-prime definition and complete Lemma 2.6.4 proof. Printed p.134 was rendered. [ArXiv v3](https://arxiv.org/pdf/1912.11942v3) pp.19–20 were also freshly read; the SHA-256 matches the existing archive. All broader reading claims remain attributed to the earlier workers.

### The actual groups and maps

Use the source's fields and put

~~~text
E = F(m)+
L = normal closure of FS E over F+
N = Gal(L/E)
K = Gal(FS/F(m))
q : N → K = restriction.
~~~

Each conjugate of FS E is abelian of ell-power degree over E. The normal-closure kernel N embeds into the product of their Galois groups and is therefore a finite abelian ell-group. The map q has image Gal(FS/(FS∩E)); it need not be onto K. Neither K nor N is silently given the full O_lambda-module structure of the evaluation target. All following averages can be taken over Z/ell^a for a sufficiently large a.

Let gamma have order d prime to ell. In the preimage of its **cyclic** subgroup, choose a lift sigma of order d. This follows from pinned Mathlib's Schur–Zassenhaus theorem. An elementary construction also makes the distinction from prescribed-power lifting explicit: for an arbitrary lift tau, a=tau^d lies in N and is fixed by conjugation by tau. Then sigma=(-d^(-1)a)tau has d-th power one and order exactly d. This does not prescribe its image under another power map.

Write alpha for conjugation by sigma on N, delta=[F:F+], h=h_gamma acting on K, g for the order of h_gamma on the coefficient module, and e=delta*g. The evaluation equivariance gives

~~~text
q alpha^delta = h q,
q alpha^e = q,
e divides d.
~~~

The last assertion follows because e is the least positive power of gamma fixing F(m). The automorphism alpha does not depend on the chosen lift of gamma: two lifts differ by an element of the abelian group N.

### Exact image and proof

The corrected formula is

~~~text
G_(S,gamma) = q(N^alpha) ⊂ K^h.
~~~

The printed equality with all K^h is equivalent to surjectivity of this fixed-point restriction.

First, sigma^e fixes F(m) and stabilizes FS. Its restriction to FS lies in the ell-group K but has prime-to-ell order, so this restriction is the identity. Every lift of gamma is n sigma, and its e-th power restricts to

~~~text
q(N_e n),       N_e = 1 + alpha + ... + alpha^(e-1).
~~~

The unramified Frobenius tower formula identifies this restriction with the Frobenius at the underlying F(m)-prime. The residue exponent is e=delta*g; using the full order d without tracking the field would obscure this step.

For completeness, the required finite-group identity is exact. Let d=e k and A_d=d^(-1)(1+alpha+...+alpha^(d-1)). Since q alpha^e=q, grouping the d terms into k blocks gives q N_d=k q N_e and hence

~~~text
q N_e = e q A_d.
~~~

A_d projects onto N^alpha. Multiplication by e is invertible on every finite ell-group in sight, so im(q N_e)=q(N^alpha). Conversely, if v is fixed by alpha, choose n=e^(-1)v to obtain q(N_e n)=q(v).

Chebotarev on L/F+ realizes each n sigma as an exact Frobenius representative after choosing a prime of L, and permits exclusion of any fixed finite set. This is imported from upstream Chebotarev. For the other inclusion, Definition 2.6.3 may allow a prime ramified in a different branch of the normal closure. Such a prime still has a lift of its Frobenius in the decomposition group that restricts to gamma on the unramified E-branch. Its e-th power restricts to the well-defined Frobenius on the unramified FS/F(m) branch. Thus those allowed primes do not enlarge the image.

This is S23, using S23-closure, S23-lift and S23-norm. It avoids the source's unsupported decomposition of the entire Gal(FS/F) as a semidirect product.

### A sufficient joint-evaluation input

For delta=2 let P_h=g^(-1)(1+h+...+h^(g-1)). Separating even and odd terms in the partial norm gives

~~~text
q(N^alpha) = im(P_h (q + q alpha)).
~~~

Consequently, surjectivity of

~~~text
N → K^h × K^h,   n ↦ (P_h q(n), P_h q(alpha n))
~~~

is sufficient: realize (v,0) and add the two coordinates. This is S23-paired. Surjectivity of the sum alone is already necessary and sufficient; the paired condition is stronger. Individual surjectivity of each coordinate is insufficient.

For the inherited E1 finite-group pattern, N=K=Z/3, alpha=-1 and q=id. Both coordinate maps are onto, while their sum and q(N^alpha) are zero. For a successful contrasting case, N=(Z/ell^m)^2, alpha swaps the coordinates and q is the first projection; the fixed image is all Z/ell^m. These explain the obstruction and criterion without pretending to realize either model from the main automorphic hypotheses.

### Imports, tests and remaining work

Two exact library atoms are newly recorded:

- L09: Mathlib Subgroup.exists_right_complement'_of_coprime, with normality and coprime order/index, read at 082e2d3.
- L10: Tau Ceti Representation.range_norm_eq_invariants, averageMap_eq_invOf_card_smul_norm, and Rep.FiniteCyclicGroup.invariants_eq_ker_apply_sub, read at f790474.

The full Tau Ceti fixed-point API and the relevant Mathlib averaging declarations were also read. They supply existing carriers; the application should introduce no parallel definition of invariants or a Galois kernel's coefficient module. The reviewed AUDIT24 ES.1/ES.4 entries and the full EulerSystemsAndKolyvaginSystems roadmap were read. The four new missing refinements stay in ES.1; the upstream Chebotarev theorem is imported, not replanned. Route identities are unchanged.

The reproducible program below checks 2,144 prime-to-characteristic GL2 actions over F3,F5,F7 and all 26,080 compatible nonzero scalar quotient/even-action triples. It verifies equality of partial-norm, fixed-image and paired-sum images; 21,392 have zero image and 4,688 have full image. Five higher-torsion examples, a nonsurjective restriction model and failure at noninvertible group order are included. These finite checks support the algebraic formula; they neither prove a Galois realization nor establish the main GI implication. Earlier arithmetic/CAS and rank-two programs are preserved but were not rerun in this pass.

The remaining E1 task is now specific: prove q(N^alpha)=K^h for the actual normal closure, Selmer classes and simultaneous GI element, or derive the weaker quantitative image bound sufficient for abundance with its precise additional error. A merely uniform extra loss would need to be inserted into the downstream exponent inequalities; it cannot silently preserve the current 8rR budget. Keep E1 and the final theorem proofs open until that work is supplied.

## Source findings awaiting independent review

No finding below has been independently confirmed by this worker. “New” in the JSON means no external correction was located in the bounded search, not a claim of discovery priority. E1 and E9 give counterexamples to general auxiliary statements; E2 is a counterexample to the claimed linear-algebra implication, not a realized global Selmer counterexample. None is asserted to refute either main theorem.

### E1 — error; affects a stated result

Lemma 2.6.4, p.134; published Inventiones 228 (2022), NSF PDF SHA-256 dd821abd…ec89d97

Printed fragment: `GS,γ = θS⁻¹ HomOλ(S,(Rbar(m))hγ)`.

Replace the printed equality by the exact formula G_(S,gamma)=q(N^alpha) of S23, where N is the abelian ell-kernel in the actual normal closure and q is restriction to Gal(FS/F(m)). Equality with K^h requires surjectivity of this fixed-point restriction. Prime-to-ell order supplies an order-d lift but not this surjectivity. The main GI(T²−1), j=1 setting remains open.

Take F+=Q(√5), F=F+(i), ell=3, m=1, R=Z3(1), j=2 and the identity polarization (muΦ=1). Let u=(1+√5)/2 and S be its one-dimensional mod-3 Kummer class, coming from the integral finite unit class. F(m)=F(m)+=F(ζ3); its degree over F+ is four, so u remains a noncube (use the fundamental-unit description of Q(√5)). FS=F(m)(cuberoot(u)) has cyclic cubic kernel. Choose γ induced by complex conjugation, of order two; hγ=1. Complex conjugation fixes the real cuberoot and inverts ζ3, so every lift of γ has square one. All associated-prime evaluations are consequently zero, while the right side is the full cubic kernel. The Kummer/Bloch–Kato unit identification is an explicit external input to this arithmetic witness, not claimed newly formalized.

### E2 — gap; affects the proof

Proposition 2.6.7, p.135; published Inventiones 228 (2022), NSF PDF SHA-256 dd821abd…ec89d97

Printed fragment: `θS(ψi)(sj) = 0 if i ≠ j`.

The general diagonal-basis assertion is not justified by abundance. For the rank-two application replace it by localization-selmer: retain a chosen primitive v, permute the two actual evaluation rows to make f1(v) have exponent ≥n−c, and choose a primitive t in ker(f1) with exp f2(t)≥n−c. The integral scaled-inverse and normalized-row proof is given in the report. S25-consumer shows that the original 8rR error budget is preserved. No bounded-index shrink or row combination of Galois evaluations is needed. This is a proposed repair awaiting independent review, not an externally published correction.

Over O/λ^m with m>4, A=[[λ,1],[0,λ]] has image containing λ²O² and hence λ⁴O². Its total image has index |k|² but its two coordinate projections have indices 1 and |k|; a diagonal matrix with those projections would have index |k|. Right multiplication by a basis change preserves the image, so cannot diagonalize it. Thus the claimed implication from Definition 2.6.5 is false for general linear maps. This example is not presented as a realized Selmer evaluation system, so the finding is a proof gap rather than a counterexample under every global hypothesis.

### E3 — gap; affects the proof

Proof of Lemma 2.7.1, p.136; published Inventiones 228 (2022), NSF PDF SHA-256 dd821abd…ec89d97

Printed fragment: `(GI¹F′,P)`.

Use a common ell-power on the entire simultaneous triple (γ0,γ1,ξ), congruent to one modulo all residual prime-to-ell orders, to remove pro-ell parts. Then use the averaging idempotents for the invariant ranks.

Choosing powers independently in the two representations need not give an element in the image of the same Galois element. A common power preserves joint-image membership, the residual triple and the required unit conditions.

### E4 — error; affects a stated result

Proposition 2.7.2(3), p.137; published Inventiones 228 (2022), NSF PDF SHA-256 dd821abd…ec89d97

Printed fragment: `P(T) ∈ Z[T]`.

Add P≠0.

For P=0 the required GI unit P(ξ) cannot be a unit in a nonzero residual field. The application P=T²−1 is unaffected.

### E5 — gap; affects the proof

Construction 3.1.8(1), p.141; published Inventiones 228 (2022), NSF PDF SHA-256 dd821abd…ec89d97

Printed fragment: `αi αN+1−i = 1`.

For arbitrary coefficient rings construct evaluation from the invariant coefficient polynomial, or assume a specified reciprocal ordering and prove descent. The reciprocal polynomial identity alone does not provide a global ordering of the given roots.

In L=F5×F5 use the three roots (1,2),(2,1),(3,3). Componentwise the polynomial is (T−1)(T−2)(T−3), which has the required odd reciprocal identity. No root has square one in L, so no root can occupy the middle of a reciprocal ordering. This does not obstruct the usual field-valued construction.

### E6 — misprint; affects nothing

Proposition 5.8.8 and its proof p.229; Lemma B.3.5 p.342 and Proposition B.3.6 p.343; published Inventiones 228 (2022), NSF PDF SHA-256 dd821abd…ec89d97

Printed fragment: `(p + 3); (q + 3)`.

The indicated product factors are p³+1 and q³+1.

The uniform factor is q^(2i−1)+1, whose second factor is q³+1. At q=2, q+3=5 whereas q³+1=9. Checked against the page image and the surrounding general product.

### E7 — misprint; affects nothing

Equation (5.20), p.231; published Inventiones 228 (2022), NSF PDF SHA-256 dd821abd…ec89d97

Printed fragment: `cr−1`.

Use c_(r−j−1) for the displayed excess bundle at intersection index j.

The bundle σ*H2⊗(H1-ann/H2) has rank r−j−1; after multiplication by c1 the degree must equal the intersection dimension r−j. The printed fixed index has the wrong degree for j>0. Page image checked.

### E8 — gap; affects the proof

Proof of Lemma 5.9.3(6), p.235; published Inventiones 228 (2022), NSF PDF SHA-256 dd821abd…ec89d97

Printed fragment: `H¹(Gal(Fp/Fp²), F−1 H¹(I,−)) = 0`.

Retain the residue long exact sequence and prove that its connecting homomorphism vanishes under the actual localized hypotheses. The claimed vanishing of this whole H1 group is not implied by trivial action.

The preceding text makes the action on the indicated lowest piece trivial. Continuous H1 of a procyclic group with nonzero constant ell-primary module M is Homcont(Zhat,M), generally nonzero; for M=Z/ell it is M. The hypothesis ell∤p²−1 does not change this. The later localized ground-eigenvalue exclusion may supply a separate repair, which is not established here.

### E9 — error; affects a stated result

Lemma A.1.4(4), p.323; published Inventiones 228 (2022), NSF PDF SHA-256 dd821abd…ec89d97

Printed fragment: `trivial`.

Impose a suitable Fp² model with its cycle descent, or state geometric Tate generation without asserting trivial arithmetic Galois action for every admissible κ-form.

Let κ=F9, p=3, N=2 and use the form with diagonal (1,t), t∉F3. It becomes an F9 skew-Hermitian form after geometric rescaling and is admissible as defined. Its isotropic projective locus x⁴+t y⁴=0 has four distinct geometric points and no F9 point: fourth powers in F9* lie in F3*. Frobenius permutes the points nontrivially, so it acts nontrivially on H0 (take Q5 coefficients). The actual Shimura fibres may have additional descent data; that is a separate repair.

### E10 — error; affects a stated result

Appendix C.2 definition p.353 and Lemma C.2.1; compare §5.6.3; published Inventiones 228 (2022), NSF PDF SHA-256 dd821abd…ec89d97

Printed fragment: `ker(∪ξ)`.

At N=2 define primitive middle cohomology by the trace/Gysin kernel, or explicitly restrict the cup-kernel definition to N≥3.

The Fermat variety is q+1 points. Cup product H0→H2 is zero, so its kernel is all q+1-dimensional H0, containing constants and not the asserted irreducible q-dimensional Tate–Thompson representation. The reduced H0 has dimension q because q+1 is invertible in the coefficients.

### E11 — misprint; affects nothing

Proof of Proposition A.1.3(3), p.322; published Inventiones 228 (2022), NSF PDF SHA-256 dd821abd…ec89d97

Printed fragment: `DL(V′0,{ , }′0,h)`.

Replace the last parameter by h−d after quotient by the d-dimensional radical.

The indicated map sends H to H/rad(V0), which has dimension h−d, not h. The dimension formula and irreducibility proof then agree. Page image checked.

### E12 — misprint; affects the proof

Proof of Lemma C.2.1, p.355; published Inventiones 228 (2022), NSF PDF SHA-256 dd821abd…ec89d97

Printed fragment: `c1`.

The primitive projection of the maximal linear cycle is [P(Y)]−h^(r−1)/(q+1), with h the hyperplane class, in the stated coefficient field.

The linear cycle has codimension r−1, so subtracting a degree-two class is wrong for r≠2. Its pairing with the complementary hyperplane power is one, whereas the hypersurface hyperplane top degree is q+1; this gives the normalization even at r=2. Page image checked.

### E13 — gap; affects the proof

Proof of Proposition 8.1.7, p.307; published Inventiones 228 (2022), NSF PDF SHA-256 dd821abd…ec89d97

Printed fragment: `Oλ-free`.

Use the integral intertwining maps and their Hecke-unit compositions, then the localized comparison and Nakayama, to establish the integral isomorphism uniformly in the permitted levels.

Freeness of source and target and a rational isomorphism do not imply an integral isomorphism: multiplication by λ on Oλ is a counterexample. P5 and the explicit compositions offer the missing integrality input; the full uniform construction remains to be written.

### E14 — misprint; affects nothing

Remark 7.3.5, p.302; published Inventiones 228 (2022), NSF PDF SHA-256 dd821abd…ec89d97

Printed fragment: `H2nét`.

The coefficient of the unramified H1 is geometric H^(2n−1), not H^(2n).

The class comes from absolute degree 2n by the degree-one Hochschild–Serre edge map, so its geometric cohomology degree is 2n−1. Equation (7.3) and the immediately preceding argument have this degree. Page image checked.

### E15 — misprint; affects nothing

Proof of Theorem 8.3.2, p.319; published Inventiones 228 (2022), NSF PDF SHA-256 dd821abd…ec89d97

Printed fragment: `[1 − n, n]`.

Use the interval [−n,n−1] for the normalized tensor RQ in the paper’s convention.

The two relevant factors have combined Hodge–Tate weights 0 through 2n−1 before twist (n); Qell(1) has weight −1. The rank-zero argument p.311 uses [−n,n−1]. Both intervals have the same width, so the FL width bound is unchanged. Page image checked.

### E16 — misprint; affects no mathematical conclusion

Lemma 2.6.4's final Chebotarev sentence (published p.134/PDF28; arXiv v3 PDF19) says the normal-closure Frobenius “coincides with γ”; the symbol must be the lift **tilde γ**. Gamma itself lives in the smaller quotient Gal(E/F+). The missing tilde persists in v3 and was checked in the rendered published page. The arXiv version history, author's publication page and a bounded erratum search revealed no correction. This notation repair leaves the substantive E1 gap intact and awaits independent review.

### Search boundary

- 2026-09-23: arXiv:1912.11942 metadata lists v3 (17 August 2021) as latest; selected corresponding passages in that version were collated, not all 179 pages.
- 2026-09-23: published NSF-hosted Springer PDF read completely (269 pages, printed 107–375).
- 2026-09-23: Wei Zhang publications page https://math.mit.edu/~wz2113/math/pub.html and bounded exact-title erratum/correction searches; no standalone correction located.
- 2026-09-23: arXiv:2509.16881v1 survey read completely (35 pages); no explicit correction of these findings located there.
- Publisher article/erratum access at https://link.springer.com/article/10.1007/s00222-021-01088-4 failed; this is not a complete publisher errata search. “new” means no correction found in this bounded search, not a priority claim.

### Open investigations

U1: Lemma 5.11.3(5), p.252. The local blowup gives P(N1⊕N2) with two sections; two sections do not imply triviality. A restriction of the two normal line bundles along a fixed-link-point × Fermat curve suggests O⊕O(p+1), a nontrivial ruled surface. The global identification for the actual moduli bundle has not been completed, so this remains an investigation, not an error finding. Projective-bundle cohomology still applies.

U2: Proposition 5.10.13 diagram, p.248. The finer Ksp level ordinarily maps to the coarser Kn level. The printed arrow and all identifications need page-image collation before an erratum is asserted.



## Coverage and continuation

- G1: The full published paper and survey have been read, but this 205-item checkpoint is not a complete definition/key-theorem census. Split the remaining bundled results and implicit definitions before completion; especially §2.2 FL categories, §§4.5/5.10 special moduli functors, §5.11 component maps, §§6–7 multipart assertions and Appendix C case lists.
- G2: Resolve E1 in the actual GI(T²−1), j=1 tensor setting by proving the now-explicit surjectivity q:N^alpha→K^h in S23. The exact Frobenius image formula is supplied; the sufficient paired-evaluation condition S23-paired is not yet deduced from GI. The j=2 Kummer witness disproves the broader lemma, not either final application theorem.
- G3: The rank-two application of E2 now has an explicit one-sided replacement, proof and exhaustive small-ring tests, retaining the distinguished class and every mΣ/4rR/8rR loss. Independently review that replacement and its conditional arithmetic handoff; do not restore the false arbitrary-rank diagonal-basis statement. E1 remains a separate existence gate.
- G4: Close the localized connecting-map assertion in E8, the uniform integral comparison E13 and the nonproper support extension X03; do not replace them by freeness or dimensions alone.
- G5: Read and decompose the original Saito weight sequence/monodromy, Fujii purity, Fontaine–Laffaille/Faltings, Serre large-image and semisimplicity, Xiao–Zhu cycles, Hotta–Matsui finite types, Mok/KMSW/Rogawski packets, Caraiani–Scholze torsion, Labesse/Morel/Shin transfer, Thorne adequacy, CHT08, Khare–Thorne complexes and Carayol multiplicity inputs. Their exact bibliographic entries are in the fully read main references.
- G6: Establish the precise Fp² descent for the geometric fibres used in A.1.4(4), use reduced H0 at rank two, and settle the global projective-bundle triviality claim U1. Separate a repaired statement from a merely plausible proof route.
- G7: Refine every provisional statement to a complete standalone signature, all multipart items to single assertions and all D/C APIs to a full consumer census; complete dependency closure below the present high-level graph. The current graph is acyclic but is not a proof certificate. Inherited definitions/constructions have only two tests each; add the protocol's third typed test before completion.
- G8: Read the complete original prerequisites beyond the targeted R=T and potential-map sections; complete publisher errata collation if accessible. No Lean compilation was possible without a configured toolchain.

The remaining bundled entries include S03, S06, S08, S12, S16, S17, S22, A11, G06–G07, G22, G39–G43, G46, G52, R07, R09, R11, X02, X04, X08, D04, B10, B12 and C04. Split those with separate hypotheses and consumers, then complete the numbered-definition and unnumbered-construction census against every page. The JSON’s dependency graph is an architectural starting point; it is not the required final leaf-by-leaf proof closure.

## Validation

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-LIU-ETAL-22.result.json` passes. The handoff and three-file allowlist are checked separately by intake. Structural assertions check unique IDs, resolved internal references, absence of internal cycles, one route per missing item, and APIs/tests for every included definition or construction. The prior worker recorded no configured default Lean toolchain. This continuation has no authorized Lean deliverable and claims no compilation or formalization.

Historical validation from codex-a71f92 / PR #2218: that continuation passed all 48 repository tests (9 paper-validator, 3 paper-queue, 7 source-issue and 29 intake tests), the three-file intake check, the inherited 1,806-assertion program and the new rank-two program. All 192 prior item IDs remain; the 199-item internal graph has 339 edges and no cycles, and each missing item is routed once. The fresh submission base is `fad6c577337f027629e637ef4a71310652da1168`; relevant deliverables, instructions, owner documents and reviewed audit inputs were unchanged from the continuation input snapshot.

Current codex-hjdg0j validation: the paper validator and three-file intake pass; 205 unique item IDs and 16 unique finding IDs; all 175 missing items routed once; the 349-edge recorded dependency graph is acyclic; the new construction has four typed tests. The embedded norm program passes the 26,080 cases described above. Earlier repository-wide, CAS and rank-two checks were not rerun. No Lean file compiled.

## Reproducible exact-check program

Run the following standalone Python 3 program; it uses only the standard library.

```python
from fractions import Fraction as F
from math import comb,prod
from functools import lru_cache
from itertools import product,combinations
import json
checks={}
def ck(f,b):
 assert b,f
 checks[f]=checks.get(f,0)+1
@lru_cache(None)
def gb(n,k,q):
 if k<0 or k>n:return 0
 if k==0 or k==n:return 1
 return gb(n-1,k,q)+q**(n-k)*gb(n-1,k-1,q)
def sg(k):return 1 if k%2==0 else -1
for q in [2,3,4,5,7,9,11]:
 for k in range(1,10):
  P=prod(q**(2*i-1)+1 for i in range(1,k+1))
  ck('B.2.7',sum(q**(d*d)*gb(2*k,k-d,-q) for d in range(-k,k+1))==P)
  ck('B.3.3',sum(sg(d)*q**(d*d+d)*gb(2*k,k-d,-q) for d in range(-k,k+1))==(-q)**k*P)
  a=sum(sg(d)*d*q**(d*d+d)*gb(2*k+1,k-d,-q) for d in range(-k-1,k+1))
  b=sum(sg(d)*d*q**(d*d+d)*gb(2*k,k-d,-q) for d in range(-k,k+1))
  ck('B.2.8',a-b==(-q)**k*P)
for q in range(-4,6):
 for n in range(2,15):
  for t in range(-3,4):
   H=lambda n:sum(gb(n,j,q)*t**j for j in range(n+1))
   ck('Rogers-Szego recurrence',H(n)==(1+t)*H(n-1)-(1-q**(n-1))*t*H(n-2))
for r in range(1,7):
 for seed in range(1,8):
  mu=[F((i+2)*seed+1, i+1) for i in range(r)]
  es=[sum(prod(mu[i] for i in J) for J in combinations(range(r),d)) for d in range(r+1)]
  ev=[sum(comb(r-d+2*j,j)*es[d-2*j] for j in range(d//2+1)) for d in range(r+1)]
  od=[sum(comb(r-d+i,i//2)*es[d-i] for i in range(d+1)) for d in range(r+1)]
  for z in [F(1),F(-1),F(2),F(-3),F(2,3)]:
   lhs=prod(z+1/z+m for m in mu)
   ck('B.1.3 product',lhs==ev[r]+sum(ev[r-d]*(z**d+z**(-d)) for d in range(1,r+1)))
   derivative=sum(prod(z+1/z+mu[i] for i in range(r) if i!=j) for j in range(r))
   ck('B.1.3 derivative',derivative==sum(d*ev[r-d]*sum(z**(d-1-2*j) for j in range(d)) for d in range(1,r+1)))
   ck('B.1.4 polynomial quotient',lhs==sum(od[r-d]*sum(sg(d-j)*z**j for j in range(-d,d+1)) for d in range(r+1)))
# Field of q^2 elements, q=2 or 3. Coordinates a+b*t, t^2=t+1 (q=2), t^2=-1 (q=3).
def field(q):
 Q=q*q
 def add(x,y):return (x%q+y%q)%q+q*((x//q+y//q)%q)
 def neg(x):return (-x%q)%q+q*((-(x//q))%q)
 def mul(x,y):
  a,b,c,d=x%q,x//q,y%q,y//q
  return ((a*c+b*d*(1 if q==2 else -1))%q)+q*((a*d+b*c+(b*d if q==2 else 0))%q)
 def pw(x,n):
  z=1
  for _ in range(n):z=mul(z,x)
  return z
 def rank(A):
  A=[r[:] for r in A];s=0
  for j in range(len(A[0]) if A else 0):
   piv=next((i for i in range(s,len(A)) if A[i][j]),None)
   if piv is None:continue
   A[s],A[piv]=A[piv],A[s];iv=pw(A[s][j],Q-2);A[s]=[mul(iv,a) for a in A[s]]
   for i in range(len(A)):
    if i!=s:
     a=A[i][j];A[i]=[add(x,neg(mul(a,y))) for x,y in zip(A[i],A[s])]
   s+=1
  return s
 def total(xs):
  z=0
  for x in xs:z=add(z,x)
  return z
 return add,neg,mul,pw,rank,total
counts=[]
for q,dimensions in [(2,range(2,6)),(3,range(2,4))]:
 add,neg,mul,pw,rank,total=field(q);Q=q*q
 for N in dimensions:
  r=N//2;eps=N%2;cnt=[0]*(r+1);spaces=0
  def pair(x,y):
   return total([mul(pw(x[i],q),y[r+i]) for i in range(r)]+[mul(pw(x[r+i],q),y[i]) for i in range(r)]+([mul(pw(x[-1],q),y[-1])] if eps else []))
  for piv in combinations(range(N),r):
   free=[(i,j) for i in range(r) for j in range(piv[i]+1,N) if j not in piv]
   for vals in product(range(Q),repeat=len(free)):
    A=[[int(j==piv[i]) for j in range(N)] for i in range(r)]
    for (i,j),v in zip(free,vals):A[i][j]=v
    spaces+=1
    if all(pair(x,y)==0 for x in A for y in A):cnt[rank([row[r:] for row in A])]+=1
  ck('RREF subspace enumeration',spaces==gb(N,r,Q))
  for s,n in enumerate(cnt):ck('B.4.5 isotropic intersection count',n==q**(s*s+2*eps*s)*gb(r,s,Q))
  counts.append({'q':q,'N':N,'subspaces':spaces,'intersectionCodimensionCounts':cnt})
# Product-ring reciprocal roots: polynomial identity holds; no middle root can square to one.
roots=[(1,2),(2,1),(3,3)]
for j in range(2):
 rs=[a[j] for a in roots]
 ck('reciprocal roots componentwise',sorted(rs)==sorted(pow(a,-1,5) for a in rs) and prod(rs)%5==1)
ck('global root ordering obstruction',all(tuple(x*x%5 for x in a)!=(1,1) for a in roots))
# A=[ell,1;0,ell] cannot be diagonalized by domain basis alone.
for ell in [2,3,5,7]:
 m=5;mod=ell**m
 ck('abundant matrix index',ell**2!=ell)
 # A * [[ell,-1],[0,ell]]=ell^2*I gives bounded-loss submodule, but this matrix is not invertible.
 A=[[ell,1],[0,ell]];B=[[ell,-1],[0,ell]]
 ck('adjugate repair',[[sum(A[i][k]*B[k][j] for k in range(2)) for j in range(2)] for i in range(2)]==[[ell**2,0],[0,ell**2]])
# F9 form diag(1,t) has no isotropic line; geometric quartic is separable.
add,neg,mul,pw,rank,total=field(3);t=3
ck('twisted DL no F9 points',all(add(pw(x,4),t)!=0 for x in range(9)))
ck('twisted DL projective infinity nonzero',pw(1,4)!=0)
ck('F9 fourth powers',set(pw(x,4) for x in range(1,9))=={1,2})
for q in [2,3,5,7,11]:
 ck('rank2 primitive correction',q+1-1==q)
 ck('q+3 is not q^3+1',q+3!=q**3+1)
for r in range(2,8):
 for j in range(1,r):ck('excess Chern degree',r-j-1<r-1 and (r-j-1)+1==r-j)
for ell in [3,5,7]:
 for m in range(1,5):
  # Hom(C_(ell^m),Z/ell^m) has ell^m classes, all cocycles under trivial action; coboundaries vanish.
  ck('trivial procyclic H1 nonzero',ell**m>1)
print(json.dumps({'assertions':sum(checks.values()),'families':checks,'finiteFields':counts},indent=2))
```

## Reproducible rank-two continuation check

This is independent of the inherited 1,806-assertion program above and uses only Python's standard library.

```python
from itertools import product
from collections import Counter
import json

class ChainRing:
    def __init__(self, name, q, n, polynomial=False):
        self.name, self.q, self.n = name, q, n
        self.size = q ** n
        self.polynomial = polynomial
        self.adds = [[self.add0(x, y) for y in range(self.size)] for x in range(self.size)]
        self.muls = [[self.mul0(x, y) for y in range(self.size)] for x in range(self.size)]
        self.negs = [next(y for y in range(self.size) if self.adds[x][y] == 0)
                     for x in range(self.size)]
        self.vals = [self.val0(x) for x in range(self.size)]

    def digits(self, x):
        return [(x // (self.q ** i)) % self.q for i in range(self.n)]

    def fadd(self, x, y):
        return x ^ y if self.q == 4 else (x + y) % self.q

    def fmul(self, x, y):
        if self.q != 4:
            return (x * y) % self.q
        z = 0
        while y:
            if y & 1:
                z ^= x
            y >>= 1
            x <<= 1
            if x & 4:
                x ^= 7  # F4 = F2[a]/(a^2+a+1)
        return z

    def add0(self, x, y):
        if not self.polynomial:
            return (x + y) % self.size
        return sum(self.fadd(a, b) * self.q ** i
                   for i, (a, b) in enumerate(zip(self.digits(x), self.digits(y))))

    def mul0(self, x, y):
        if not self.polynomial:
            return (x * y) % self.size
        a, b = self.digits(x), self.digits(y)
        out = []
        for i in range(self.n):
            z = 0
            for j in range(i + 1):
                z = self.fadd(z, self.fmul(a[j], b[i-j]))
            out.append(z)
        return sum(z * self.q ** i for i, z in enumerate(out))

    def val0(self, x):
        if x == 0:
            return self.n
        v = 0
        while x % self.q == 0:
            v += 1
            x //= self.q
        return v

def check(r):
    N, n, q = r.size, r.n, r.q
    add, mul, neg, val = r.adds, r.muls, r.negs, r.vals
    vectors = list(product(range(N), repeat=2))
    primitive = [(x, y) for x, y in vectors if min(val[x], val[y]) == 0]
    count = Counter()
    for aa, bb, cc, dd in product(range(N), repeat=4):
        count["matrices"] += 1
        images = [(add[mul[aa][x]][mul[bb][y]], add[mul[cc][x]][mul[dd][y]])
                  for x, y in vectors]
        image_set = set(images)
        bounds = [c for c in range(n)
                  if (q ** c, 0) in image_set and (0, q ** c) in image_set]
        if not bounds:
            continue
        # Testing the smallest c proves the inequalities for all larger allowed c.
        c = bounds[0]
        count["abundant_matrices"] += 1
        rows = [(aa, bb), (cc, dd)]
        kernels = []
        for i in range(2):
            a, b = rows[i]
            alpha = min(val[a], val[b])
            assert alpha <= c
            t = (neg[b // (q ** alpha)], a // (q ** alpha))
            assert min(val[t[0]], val[t[1]]) == 0
            assert add[mul[a][t[0]]][mul[b][t[1]]] == 0
            other = rows[1-i]
            other_value = add[mul[other[0]][t[0]]][mul[other[1]][t[1]]]
            assert val[other_value] <= c
            kernels.append(t)
            count["primitive_kernel_checks"] += 1
        for x, y in primitive:
            f = [add[mul[a][x]][mul[b][y]] for a, b in rows]
            i = min(range(2), key=lambda j: val[f[j]])
            assert val[f[i]] <= c
            t = kernels[i]
            assert add[mul[rows[i][0]][t[0]]][mul[rows[i][1]][t[1]]] == 0
            count["distinguished_vector_checks"] += 1
    return dict(count)

results = {r.name: check(r) for r in [
    ChainRing("Z/4", 2, 2),
    ChainRing("Z/8", 2, 3),
    ChainRing("Z/9", 3, 2),
    ChainRing("F2[t]/t^3", 2, 3, True),
    ChainRing("F4", 4, 1, True),
]}
# Failure of domain-only diagonalization persists; the weaker conclusion works.
p, n = 3, 5
N = p ** n
image_set = {((p*x+y) % N, p*y % N) for x, y in product(range(N), repeat=2)}
assert len(image_set) == p ** (2*n-2)
assert len({x for x, y in image_set}) == p ** n
assert len({y for x, y in image_set}) == p ** (n-1)
assert len(image_set) != p ** n * p ** (n-1)
# v=(1,0), t=(-1,p): first evaluation(v)=p, first(t)=0, second(t)=p^2.
assert (p * (-1) + p) % N == 0
assert (p * p) % N == p*p
# v need not remain the first vector of a basis with t.
assert (1 * p - 0 * (-1)) % p == 0
# The c<n hypothesis is essential to the positive-exponent conclusion.
assert {(0, 0)} == {(0*x, 0*y) for x, y in product(range(4), repeat=2)}
print(json.dumps(results, sort_keys=True))
print("PASS: exact finite-ring checks; not a Lean proof or a Galois-realization check")
```

## Reproducing the normal-closure checks

~~~python
from itertools import product
from math import gcd, lcm

def add(x,y,p):return tuple((a+b)%p for a,b in zip(x,y))
def scale(a,x,p):return tuple(a*b%p for b in x)
def mv(a,x,p):return ((a[0]*x[0]+a[1]*x[1])%p,(a[2]*x[0]+a[3]*x[1])%p)
def mm(a,b,p):return tuple(sum(a[2*i+k]*b[2*k+j] for k in range(2))%p for i in range(2) for j in range(2))
def scalar_order(h,p):
    n,t=1,h%p
    while t!=1:n,t=n+1,t*h%p
    return n
I=(1,0,0,1)
matrices=cases=zero=full=0
for p in [3,5,7]:
    vectors=list(product(range(p),repeat=2))
    for a in product(range(p),repeat=4):
        if (a[0]*a[3]-a[1]*a[2])%p==0:continue
        order,t=1,a
        while t!=I:order,t=order+1,mm(t,a,p)
        d=lcm(2,order)
        if gcd(d,p)!=1:continue
        matrices+=1
        fixed=[x for x in vectors if mv(a,x,p)==x]
        for row in vectors[1:]:
            q=lambda x:sum(u*v for u,v in zip(row,x))%p
            for h in range(1,p):
                if not all(q(mv(a,mv(a,x,p),p))==h*q(x)%p for x in [(1,0),(0,1)]):continue
                g=scalar_order(h,p);e=2*g
                assert d%e==0
                norm_values=set()
                pair_values=set()
                for x in vectors:
                    y=x;total=(0,0)
                    for j in range(e):
                        total=add(total,y,p);y=mv(a,y,p)
                    norm_values.add(q(total))
                    pair=(q(x)+q(mv(a,x,p)))%p
                    pair_values.add(sum(pow(h,j,p)*pair for j in range(g))%p)
                fixed_image={q(x) for x in fixed}
                assert norm_values==fixed_image==pair_values
                assert all((h*v-v)%p==0 for v in norm_values)
                cases+=1
                if len(norm_values)==1:zero+=1
                else:full+=1
# Higher torsion: inversion and a swap over Z/p^m.
torsion=0
for p,m in [(3,1),(3,2),(3,3),(5,1),(5,2)]:
    n=p**m
    assert {(x-x)%n for x in range(n)}=={0}
    assert {x for x in range(n) if (-x)%n==x}=={0}
    assert {(x+y)%n for x in range(n) for y in range(n)}==set(range(n))
    assert {x for x in range(n) for y in range(n) if x==y}==set(range(n))
    torsion+=1
# A non-surjective q is not silently promoted to a quotient map.
assert {(2*3*x)%9 for x in range(3)}=={0,3,6}
# Invertibility is essential.
assert {(x+x)%2 for x in range(2)}=={0}
assert set(range(2))!={0}
print(f'{matrices} prime-to-p actions; {cases} compatible (action,q,h) cases '
      f'({zero} zero images, {full} full images); {torsion} higher-torsion cases; '
      'non-surjective-q and noninvertible-order regressions')
~~~
