# Red team: Calegari–Dimitrov–Tang, *The unbounded denominators conjecture*

Agent: Codex. Session: `codex-rtOQ9t`. Issue: [#4260](https://github.com/CBirkbeck/tauceti-explorer/issues/4260). Status: complete.

There are six findings: five high and one medium. They concern the extraction’s contracts and omitted source qualifications, not a counterexample to the main scalar unbounded-denominators theorem. The result JSON gives the affected items and executable repair instructions. The accepted extraction has substantial useful coverage; these findings prevent false statements and an invalid connection construction from entering its design briefs.

## Evidence and scope

The audit used atlas commit `f64cfc460af226a7dfcbb7f70f77a030b8c04f31`. I read all 148 items, 26 prerequisite records, nine routes, eleven existing source issues, the extraction report and both accepted-review files. The extractor was Claude Code `cc-d67081` ([PR #1902](https://github.com/CBirkbeck/tauceti-explorer/pull/1902)); the reviewer was `cc-7b31c4` ([PR #2415](https://github.com/CBirkbeck/tauceti-explorer/pull/2415)). Neither was this worker.

The primary text was the [published JAMS offprint](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), volume 38 (2025), pp.627–702. All 76 pages were read, with image checks of pp.637, 640–641 and 688–691. Its SHA-256 is `867026fbcc5592728173e5c4d6a87f58d57a55b0d0d8b0109b9774e84290ee1e`. The selected comparison text was [arXiv v4](https://arxiv.org/pdf/2109.09040v4), 16 September 2024, SHA-256 `9bffb12953db37d237e75451ed659219d955bf57d55da8dbc09ad888f62956ad`: its pp.12 and 53–54 contain the same quotient-representation slips, rank claim and unqualified corollary. Findings below are against the published text or the extraction as explicitly distinguished.

On 2026-10-01 I checked the [author’s research page](https://math.uchicago.edu/~fcale/research.html), its linked current PDF, the [arXiv version listing](https://arxiv.org/abs/2109.09040), [Crossref metadata](https://api.crossref.org/works/10.1090/jams/1053), and title/author searches for errata and corrections. No correction to these passages was located; Crossref supplied no update-to entry and an empty relation object. These are the bounded searches to carry into new sourceIssues entries, not evidence that no correction exists anywhere.

## 1. Eisenstein’s normalization — high

The item `eisenstein-theorem` claims that rescaling the Puiseux variable makes every algebraic branch integral. The algebraic constant series `y=1/2` disproves it: the constant coefficient is unchanged by variable scaling, and a rational algebraic integer must be an integer.

Use positive integers `c,M` with `c*y ∈ Zbar[[x^(1/N)/M]]`, or retain the variable-only conclusion under an integral-constant-term hypothesis. The actual use on p.637 has the normalized inverse branch `x(y)=ζ_N*y^(1/N)+…`, so the constant coefficient is zero and this objection does not apply. Page 695 invokes Eisenstein only for finiteness of the exceptional primes. The false generalization belongs to the extraction; it should not be registered as an error in the source application. Route 2’s first layer must use the corrected formulation.

## 2. Wohlfahrt’s central-sign hypothesis — high

The extracted cusp width is geometric: it is the smallest positive `m` for which either sign of the conjugate of `T^m` lies in the group. Under that definition, the unrestricted assertion that a congruence group of level `N` contains `Γ(N)` is false.

Take `H=Γ(2)∩Γ₁(4)`. It contains `Γ(4)`, so is congruence. A matrix in `Γ(2)` has even off-diagonal entries and odd diagonal entries; determinant one gives `ad≡1 mod 4`, hence `a≡d mod 4`. One of its two signs therefore lies in `H`. Thus `±H=Γ(2)`, and its projective cusp widths are the three widths of `Γ(2)`, all equal to 2. But `−I∉H`, so `Γ(2)⊄H`.

Require `E={±I}⊆G`, as the source application on p.659 does. Alternatively formulate the projective conclusion `Γ(N)⊆⟨G,−I⟩`. Correct the item, the Wohlfahrt prerequisite description and route 1. This is another extraction error; the published application already has the required hypothesis.

## 3. Theta’s weight-one character — high

The identity with `θ₃²` is compatible with modularity with a character. It is incompatible with the extraction’s unqualified trivial-character weight-one modularity on `Γ(2)`: slash by `−I` would give `f=−f`, while the series has constant coefficient 1.

The corrected contract is weight one with character `χ(γ)=χ_{−4}(d)` on `Γ(2)`, or trivial character on `Γ(2)∩Γ₁(4)`. At the Mathlib pin, `jacobiTheta_T_sq_smul` and `jacobiTheta_S_smul` give the needed transformations. Squaring gives slash multiplier `−i` for `S` and 1 for `T²`; composing through `U₂=S*T^(−2)*S^(−1)` gives multiplier 1 for `U₂`, while `−I` has multiplier −1. These agree with `χ_{−4}(d)` on the standard generators of `Γ(2)`.

Update route 1’s theta statement while importing QM.1’s multiplier conventions and upstream ModularForms Layer 0’s parity convention. Keep the hypergeometric identity and the infinite-monodromy/transcendence statement. The source itself omits the character qualification at (1.1.5), p.631, and (7.2.4), p.688, so record that source issue rather than silently changing its wording.

## 4. The rank-6n connection construction — high

For the weight-zero, one-dimensional form `F=1` with trivial representation, every one of the six scalar slash translates equals 1. Over the displayed base ring their span is free of rank one. It cannot be the advertised rank-six module. More generally the declared rank `6n` and the displayed `GL_n(C)` monodromy cannot be the same bundle’s rank and monodromy dimension.

The problem is not repaired by deleting the numeral alone. A scalar span has not thereby been proved stable under differentiation, and an arbitrary complex representation has not thereby acquired an integral algebraic model. The source makes these assertions on p.690, and `vvmf-connection` copies them into the plan.

Separate the rank-`n` complex local system attached to the representation from the local system generated by analytic continuations of the component under study. The latter can have smaller rank; in this example it has rank one. Then give precise supplier statements for the regular-singular differential-module realization and for the arithmetic differential equation needed before applying the G-function theorems. A rational Taylor series and a finite-dimensional continuation space require a descent argument; declaring a free integral module is not that argument. Also justify any irreducibility reduction, rather than retaining the source’s assertion as an automatic step.

The fixer can record the unsupplied bridge explicitly as missing, with its required conclusion and source search, rather than claiming to have repaired the proof by a change of rank. This finding registers an invalid construction and a proof obligation. It does not assert that Theorem 7.3.3 is false.

## 5. Mason’s corollary needs an effective representation — high

Definition 7.3.1 on pp.688–689 allows the values of `F` to lie in a proper invariant subspace. Fourier information about `F` cannot constrain the unused summand of the representation. The following example uses a nonzero form, so merely excluding the zero form does not help.

Write `PSL₂(Z)=⟨S,R | S²=R³=1⟩`, with `T=SR`. Define

```text
σ(S) = [ 1  0 ]       σ(R) = [  2   1 ]
       [ 0 -1 ]              [ -7  -3 ]

σ(T) = [ 2  1 ],      det σ(T) = -1,     tr σ(T) = 5.
       [ 7  3 ]
```

Exact integer multiplication gives `σ(S)²=I` and `σ(R)³=I`, so these matrices define a representation. The eigenvalues of `σ(T)` are `(5±sqrt(29))/2`; they are distinct, and one is greater than one. Thus `σ(T)` is semisimple of infinite order.

Set `ρ=1⊕σ` and `F(τ)=(1,0,0)` of weight zero. Transformation, holomorphy and moderate growth hold, `ρ(T)` is semisimple, and every Fourier coefficient is integral. Nevertheless the ambient representation has infinite image, contrary to the unqualified corollary on p.691.

Require `span_C{F(τ)}=C^n`, equivalently linear independence of the component functions, for the full-representation conclusion. Without that hypothesis, assert the congruence conclusion only for the restricted representation on that span. Indeed, once every component is congruence, intersect their congruence groups; its elements fix every `F(τ)`, and hence act trivially on exactly this invariant span. The original broad definition and componentwise Theorem 7.3.3 may remain. Update route 1’s target and record the omitted source hypothesis.

## 6. Two local quotient-representation slips — medium

At (2.3.2), p.640, reconstruction from `log|G|` loses a unimodular constant. Put `g=G=i` and `B=1`: both exponential factors are 1. Multiply their quotient by `G(0)/|G(0)|`, or state the equality only in absolute value. The same phase correction applies to the preceding radius-`r` formula.

The first line of p.641 then bounds `sup_D|h|` by the mean of `log⁺|g|`. For `g=h=1` that says `1≤0`. The left side should be `sup_D log|h|`. The statement of Lemma 2.3.1 already uses logarithms, and the rest of its argument concerns absolute values. These corrections preserve the lemma and require two sourceIssues records. The extraction’s `herglotz-log` item, which assumes `g(0)=1`, is not itself the faulty identity.

## Checks that did not become findings

All 28 named library references behind the 14 library items were inspected at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The inspections include the hypotheses of q-expansion convergence, Jensen’s formula, weak-dual sequential compactness and inflation–restriction; they are not claims of newly compiled corollaries. The elementary changes of normalization and the probability-measure specialization remain proof work where needed.

In particular, the apparent near miss for disc Nevanlinna theory is justified. `MeromorphicOn.divisor`, `Mathlib/Analysis/Meromorphic/Divisor.lean:41–43`, tests meromorphicity on its entire specified domain before assigning any order. `ValueDistribution.logCounting`, at `LogCounting/Basic.lean:354–357`, uses the domain `univ`; if a disc function’s total extension is not globally meromorphic, that divisor is zero. Consequently the general disc counting function is not obtained merely by substituting an arbitrary extension into this definition. The proximity definition has no corresponding divisor obstruction. I found no pinned Hadamard determinant inequality to contradict the extraction’s Fekete note.

Every missing item is routed once, and no library or planned item is routed. All cited stage IDs and Part-II parents exist. The five planned-item families and six source-route stages were checked against the assembled atlas, reviewed library coverage and applicable restructurings. The proposed three Part-II owners have distinct analytic, arithmetic-algebraization and modular-form roles. The Smith extraction supplies a general complex-capacity interface to the arithmetic-algebraization proposal; it explicitly leaves the latter’s specialized holonomy results with that owner. Generic supplier ownership still has to be respected when the briefs become blueprints; reading a broad source route is not a proof of its theorem.

I retained sourceIssues E1–E11 after checking their printed loci and corrections. This audit did not reproduce the Magma computations at levels 8 and 16 or recursively verify every cited external proof. That is not necessary to the explicit counterexamples above, and no claim of complete formal verification is made.

## Validation

The deliverables are this report and its result JSON only. Validation: `scripts/check_redteam.py`, the intake `check-files` check for both deliverables, and `git diff --cached --check`. There is no Lean deliverable; no Lean build or language server was started.
