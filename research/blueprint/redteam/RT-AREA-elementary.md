# RT-AREA-elementary — red team of the Elementary number theory area

**Result: two findings, one medium and one low. The head I expected to pay came back clean, and the reason is worth more than a finding would have been.**

Red team: Claude Code, session `cc-fb70e5`, 24 September 2026. Target: the area *Elementary number theory (Elementary and computational number theory)*, which is a **single** roadmap — `ClassicalArithmeticCompletion`, "Classical arithmetic, sequences, polynomials and reciprocity", campaign origin, lifecycle `proposed`, **8 stages** and **13 accepted paper routes**.

| stage | title | audit verdict | routes |
|---|---|---|---|
| CA.0 | Divisibility and multiplicative arithmetic | **built** | 0 |
| CA.1 | Residues and reciprocity | partly built | 4 |
| CA.2 | Sequences and generating functions | partly built | 2 |
| CA.3 | Polynomial and matrix arithmetic | partly built | 3 |
| CA.4 | Classical Diophantine equations | partly built | 6 |
| CA.5 | Number-field arithmetic handoff | process | 0 |
| CA.6 | Special algebraic numbers and Mahler measure | partly built | 2 |
| CA.7 | Integral Galois modules and orders | partly built | 0 |

**Eligibility measured:** none of the papers this session has reviewed routes here, checked at route granularity across all 207 paper result files. No entanglement.

## Attack 1 — the library boundary. **Clean, because AUDIT-18 already did it, and better than I did.**

This was the head I expected to pay. An *elementary* entry layer sits on Mathlib's strongest material, and this is the head that produced the model-theory area's sharpest finding (a stage instructing a worker to construct ultraproducts and prove Łoś transfer when Mathlib has both). Here it yields nothing, and twice the accepted audit got there first.

**The audit is finer-grained than my probes.** CA.0 is verdicted `built`, with all ten of its targets mapped to named declarations — gcd with Bézout and the extended Euclidean algorithm, prime factorisation, congruences and residue rings, the Chinese remainder theorem for coprime moduli *and* at non-coprime moduli with the compatibility hypothesis `a ≡ b [MOD gcd n m]`, p-adic valuations with Legendre's formula in both forms, the arithmetic functions with multiplicativity, Dirichlet convolution, Möbius inversion at divisor sums, and the general divisor-sum identities.

**A finding of mine that dissolved, one reading from being filed.** CA.6 says "**Construct** Mahler measure, house, Pisot/Salem classes … and multiplicative identities". Mathlib has `Polynomial.mahlerMeasure`, `logMahlerMeasure` and — precisely the identity the stage asks a worker to prove — `mahlerMeasure_mul`, in `Mathlib/NumberTheory/MahlerMeasure.lean` and `Mathlib/Analysis/Polynomial/MahlerMeasure.lean`. That is the model-theory finding's exact shape. But the audit already marks the target `partial` with the note:

> "For complex polynomials: definition as a circle average, multiplicativity, M(p) = |lc|∏max(1,|α|) and coefficient bounds. **The Mahler measure of an algebraic number (of its minimal polynomial over ℤ) is not defined.**"

That is the correct distinction, already drawn. No finding.

**A false positive of mine that the same audit had already pre-empted.** Searching Pisot and Salem returns 2 Mathlib files, which reads as the classes existing. They are **Salem–Spencer sets** in additive combinatorics — a different Salem. The audit records exactly this: "Searched Pisot and Salem (matches are only Salem–Spencer sets): nothing in either library", marked `absent`. Reading the files rather than trusting the grep is what settled it, and I would not have caught it from counts alone.

So the roadmap naming no Mathlib declaration in its own text is **not** a gap either: the library mapping lives in the audit, which is this programme's division of labour.

## Attack 2 — a calibrated-looking anomaly that dissolved on origin

CA.0's audit verdict is `built` — ten of ten targets in the libraries — while the atlas still carries it as `status: needs_source_decomposition`. So the roadmap asks a worker to decompose a layer the accepted audit says is done. Of the **66** layers verdicted `built` atlas-wide, only **4** carry that status: CA.0, `GeometryOfNumbersAndQuadraticArithmetic:GN.0`, `AnalyticNumberTheory:AN.0` and `:AN.1`. Four of 66 looks like a calibrated anomaly.

It is not. **All 907 campaign-origin audited layers carry `needs_source_decomposition`**, whatever their verdict; the other 62 `built` layers are tauceti-origin and every one carries `unknown`. The status field is constant within each origin class and says nothing about audit verdicts. Not a finding, and not specific to this area. (This is the third apparent anomaly that origin explained across this area pair.)

## Attack 3 — what the routed papers need that nothing plans. **Findings 1 and 2.**

### Finding 1, medium — the Markoff equation has no owner

**Four** accepted extractions route the Markoff and Markoff–Hurwitz theory into CA.4:

| paper | routed to CA.4 |
|---|---|
| `MARTIN-25` | the coefficient-three Markoff equation, the Vieta involutions, the positive-integer tree and the descent to (1,1,1) — the accepted owner of the carrier |
| `GHOSH-SARNAK-22` | the same carrier extended to **every level set** x₁²+x₂²+x₃²−x₁x₂x₃ = k, with the descent |
| `CHEN-24` | the trace-coordinate normalisation x²+y²+z²−xyz = 0 and the twist (x,y,z) ↦ (3x,3y,3z) identifying it with the coefficient-three form over ℤ[1/3] |
| `GAMBURD-MAGEE-RONAN-19` | the **n-variable Markoff–Hurwitz** equation x₁²+…+xₙ² = a x₁⋯xₙ + k, its moves, exceptional families, the passage V(ℤ)→V(ℤ₊), Cassels-style estimates and infinite descent |

CA.4's own description is: "Supply **Pell equations, sums of squares, elementary descent** and source-scoped exponential equations. Route general genus-one/higher-genus solutions to effective Diophantine and rational-point owners… Include **linear Diophantine systems, numerical semigroups/Frobenius numbers and Egyptian-fraction identities**." It never names Markoff, and neither do its eight audited targets — consistent, since an audit audits the roadmap's targets, so this is a **roadmap gap, not an audit error**.

Nor does anything else own it. A case-insensitive search of **both** roadmap directories returns **0 files** for `Markoff`; the `Markov` hits are Markov processes, semigroups and chains (`OneParameterSemigroups`, `Exchangeability`, `GeometricTopology`, `OptimalTransport`) — a different Markov. Before calling it absent I also searched "Markov triple", "Hurwitz equation", "Vieta involution", "descent tree" (all 0) and the equation shapes `xyz` and `x₁x₂x₃`, whose only two matches are false positives: the term `a₁XYZ` in `ModularCurves`' projective Weierstrass cubic, and the triangle-group presentation `x₁ⁿ = x₂ᵐ = x₃ˡ = x₁x₂x₃ = 1` in `BelyiMaps`. The libraries have nothing: `Markoff`/`markoff` and `vietaInvolution` are 0 files in both, and the only Markov-named files are Tau Ceti's `KnotTheory/Markov.lean` and probability files and Mathlib's `CategoryTheory/MarkovCategory`.

Four sources is heavy weight for an unnamed target, and the n-variable Markoff–Hurwitz equation is a distinct theory rather than a worked example of Pell or sums of squares.

### Finding 2, low — the Schur–Siegel–Smyth trace problem

`PAPER-SMITH-24` routes to CA.6 "the notion of a totally positive algebraic integer with its **trace ratio**, the constant λ_SSS with the chain of bounds from Schur's e^{1/2} ≤ λ_SS[S]". CA.6 names the Mahler measure, the house, Pisot/Salem, lower bounds, finiteness and roots of unity — nothing about a trace. The route argues its placement from the MSC class ("which is MSC 11R06, the same classification as the trace problem"), which is itself the tell that no target names it. Searches for "trace problem" and "totally positive algebraic integer" return **0 files** across both roadmap directories.

**A distinction worth stating, because the shared name invites error in both directions.** CA.6's audited target "Selected proven lower bounds (Kronecker; **Smyth**, Dobrowolski, Schinzel–Zassenhaus)" is about lower bounds for the *Mahler measure* — a different result of Smyth's from the trace problem. Had I matched on the name I would either have filed a duplicate or dismissed a real gap.

Library probes: `traceRatio`, `Schur–Siegel`, `Smyth`, `Dobrowolski`, `Schinzel` all **0 in both**; `Kronecker` 14 and 45, matching the audit's note that Kronecker's theorem is present. I also **read** Tau Ceti's ten `totallyPositive` files rather than counting them: they concern totally positive elements in narrow class group, ray class and unit signature settings, and no occurrence pairs `totallyPositive` with a trace. So the predicate exists and would not be rebuilt, while the trace ratio and λ_SSS do not.

Severity is **low**, not medium: one paper routes it, and the material does sit inside CA.6's stated subject, so the defect is that no target names it rather than that it is unplanned in principle.

## Attack 4 — dependency bookkeeping and duplication. Clean, and worth recording.

Part 1 of the sibling Algebraic number theory area failed exactly this test, so I ran it here. **This roadmap passes it in every case available.** It declares three prerequisites — `ArithmeticDynamics`, `DiophantineApproximationAndTranscendence`, `KTheoryLowDegrees` — and **all three list it in their own `consumers`**. Its own eight `consumers` include `GeometryOfNumbersAndQuadraticArithmetic`, which reciprocally declares it as a prerequisite. The stage edges agree: CA.6 requires `ArithmeticDynamics:DY.1` and `DiophantineApproximationAndTranscendence:DT.0`, CA.7 requires `KTheoryLowDegrees:Z.1`. Nothing is stated in prose and left unrecorded.

**Duplication**, which for a single-roadmap area means its declared neighbours. The pair at risk is CA.6 against `DiophantineApproximationAndTranscendence:DT.1`, whose audited target is "Liouville's inequality with the effective constant 2^{1−d} M(α)^{−1} (Mahler measure)". DT.1 **consumes** the measure rather than owning it — its instruction is "Prove Liouville bounds, then reproduce a complete source proof of Roth using auxiliary polynomials, index estimates and its inequality chain", with no construction — and DT.5's "Mahler functions" are a different object. The direction is recorded correctly, CA.6 requiring DT.0. No mathematics is planned twice.

**The negative Pell equation** (`KOYMANS-PAGANO` → CA.4: the set 𝒟⁻, rational solubility through Hasse–Minkowski, Dirichlet's theorem on p ≡ 1 mod 4, the narrow-class-group reformulations) is **not** an omission: CA.4's target is "Pell equations" with solutions "classified through units with positivity conventions", which covers the negative equation, and Tau Ceti has the narrow class group and totally positive elements the reformulation needs.

## What this red team did not do

I did not re-derive the mathematics of any stage, and I did not re-audit the libraries against CA.1–CA.7 target by target: AUDIT-18 is accepted and this red team's job is to break it where it is wrong, not to repeat it, so I probed only where the roadmap's verbs and the routed papers gave a reason to. Omissions were tested against the 13 routed papers and the roadmap's own targets, not against the wider elementary-number-theory literature, so an omission that no routed paper happens to need would not have been caught. CA.5 (`process`) and CA.7 receive no routes and were read for scope only. Every library number here comes from a full Mathlib checkout of 8556 `.lean` files and the Tau Ceti tree of 5268, with the file count printed beside each result — a precaution taken because two wrong tree paths returned false cleans earlier in this session.
