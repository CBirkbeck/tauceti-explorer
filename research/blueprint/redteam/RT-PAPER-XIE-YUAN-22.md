# RT-PAPER-XIE-YUAN-22: red team of the Xie–Yuan extraction

Red team: Claude Code, session `cc-f805bf`, 29 September 2026.

Target: `PAPER-XIE-YUAN-22`, the extraction of J. Xie and X. Yuan, *Geometric Bogomolov conjecture in arbitrary characteristics*, Invent. Math. **229** (2022) 607–637, arXiv:2108.09722. The extraction is by `cc-39fac3`, and it was accepted by `REV-PAPER-XIE-YUAN-22` (`cc-fb70e5`). I did neither job.

**Result: ten findings. One is high, five medium and four low.**

The bulk of the extraction holds:

- All 65 statements and locators match the paper.
- All four library citations are correct at the pins.
- Every missing item is routed exactly once.
- All fifteen recorded source issues are right.

The high finding is a false item: Proposition 5.4 relies on a false step. Two more unrecorded mistakes are in §3. The medium omissions are the properties of heights, torsion density and the inputs of §4.

## Source

On 29 September 2026 I re-fetched [arXiv:2108.09722v1](https://arxiv.org/pdf/2108.09722v1).

- **Hash.** SHA-256 `2587e703…11c2ab`, which is the recorded value. The unversioned URL serves the same file.
- **Versions.** The arXiv API lists only v1.
- **Published version.** Springer serves only a cookie wall, and Crossref records no correction. So every finding is scoped to arXiv v1, as the extraction's own is.
- **What I read.** The whole paper. The text layer drops overlines, so I checked page images of pp. 13, 16 and 25.

I also read the cited inputs at their sources:

- Yamaki, arXiv:1405.0896v5, Theorem 1.5;
- Gubler, arXiv:math/0609387v2, §3.1, Theorem 3.6, Lemma 4.1 and Corollary 4.4;
- Conrad, *Chow's K/k-image and K/k-trace*, Theorem 9.15;
- Scanlon, arXiv:math/0303340v1, Theorem 2.2.

## What held

**Items.** Every item matches its locator, page by page through §§2–5.

**Counts.** There are 4 library items, 9 planned and 52 missing. The 52 missing ids are distinct and exactly the routed ones. Every stage id resolves.

**Library.** I opened each cited declaration at Mathlib `082e2d3` and Tau Ceti `f790474`:

- Tau Ceti's `AbelianVariety` (a proper, geometrically integral group object), with `prod`, `baseChange`, `mulBy` and `IsIsogeny` (finite and surjective);
- Mathlib's `Algebra.trdeg`, `Matrix.IsReducedRowEchelon` and `AlgebraicCycle`;
- Tau Ceti's `isReducedRowEchelon_rowReduceMatrix`.

A search of both libraries for every missing notion (nef, Bertini, trace, Northcott, Chow, abelian schemes, heights, multiplicities) found nothing that gives an item.

**Planned stages.** I read each cited stage in full: RP.5, SF.5, MC.0, A3, A6, R11.1 and R11.3. They cover the items in the paper's characteristic-free generality. The exceptions are findings 1 and 8.

**Routes.**

- The function-field heights and the trace follow PAPER-GAO-HABEGGER-19's accepted routing to RP.0 and RP.1.
- Gubler's Corollary 4.4 sits in the same Part II as GH19's item 72.
- The Yuan–Zhang fundamental inequality in ArakelovGeometryAndAbelianHeightsPartII (PAPER-DEMARCO-MAVRAKI-YE-26/35) is the number-field version, so it is not a duplicate.

**Source issues.**

- E1: both counterexamples and the repair are right.
- E2–E5: confirmed.
- E6–E15: confirmed in the text.

**The review's changes.** These are the verdicts and the Manin–Mumford note. The note is consistent with Scanlon's Theorem 2.2 and its attribution to Pink–Roessler. No error was introduced.

## Findings

### 1. Zariski closures of abelian subvarieties need not be abelian schemes (high, error)

Item `good-reduction-model` says that abelian subvarieties of a good-reduction A "have Zariski closures that are abelian subschemes". The paper asserts the same thing, without proof, in Proposition 5.4 (p. 25): "Both 𝒜′ and ℬ are abelian schemes over S." Proposition 5.4 then feeds these closures to Proposition 2.1, Proposition 4.2 and Lemma 4.1.

In characteristic p this is false. Here is a counterexample over P¹:

- Let E be supersingular and C₀ = E × E.
- Let G ⊂ C₀ × P¹ be the Moret-Bailly family of α_p-subgroups G_λ = {(at, bt)}, for λ = (a:b).
- The homomorphism (C₀ × P¹)/G ×_{P¹} (C₀/G_{λ₀} × P¹) receives C₀ × P¹ by a map that is a closed immersion generically but has kernel α_p at λ₀.
- By specialization of cycles, the closure of the image has fibre p·[D] at λ₀. So it is not smooth.

Trivial trace, as in the paper's setting, does not obviously exclude the same collision. Nothing records this step.

*Fix:*

- Delete the clause from the item.
- Record the step as a new source issue, E16.
- Repair the proof with Néron models: take 𝒜′ to be the Néron model of A′, set ℬ = 𝒜 ×_S 𝒜′, and let h be the projection.

### 2. The reduction in the proof of Proposition 3.6 is false (medium, missing source issue)

The proof says k′ ↦ k′ ∩ K is a bijection I(K̄/k̄) → I(K/k), compatible with specialness. Both claims fail.

Take K = k(s, t) and k′ the algebraic closure of k(√s + t). A Galois-conjugation argument shows k′ ∩ K = k = k̄ ∩ K, so the map is not injective. A point P with x(P) = √s + t on a constant elliptic curve is special over k′ but not over k, so specialness is not preserved.

The statement survives by a Galois argument: take the compositum of the conjugates of the field for K̄, close it algebraically, and intersect with K. Theorem 1.1 needs only the algebraically closed case.

*Fix:* record the reduction as source issue E17, with that repair.

### 3. The proof of Proposition 3.2 needs algebraic independence (medium, missing source issue)

The existence proof needs a flat quasi-finite map U → S₁ × S₂ and the finiteness of k(V)/k(S₁). Both need trdeg(k₁k₂) = trdeg k₁ + trdeg k₂, but the statement assumes only k₁ ∩ k₂ = k.

Corollary 3.5(i) applies the proposition to arbitrary k′ and k_A, which can be algebraically dependent. For example, k(x, y)‾ and k(z, x + yz)‾ inside k(x, y, z)‾ meet in k but are dependent.

Theorem 1.1 needs only two distinct subfields of transcendence degree 1, and these are always independent.

*Fix:* record the gap as source issue E18. Then either prove the dependent case, or restrict Proposition 3.2 to the independent case and give the direct two-field argument that Proposition 3.1 actually needs.

### 4. Properties of ĥ that the proofs use have no item (medium, missing)

The extraction defines ĥ only through models. The proofs also need:

- functoriality under homomorphisms and isogenies (Lemma 5.3 passes to B × C);
- additivity on products ĥ_{p₁*L₁+p₂*L₂};
- comparability of heights for two ample bundles;
- behaviour under the finite extensions of K that the reductions make;
- the identification with the M_K-field Néron–Tate height. This is the height used by Conrad's Theorem 9.15, Yamaki's Theorem 1.5 and Gubler's Lemma 4.1 and Corollary 4.4.

Gubler's Theorem 3.6 is the paper's own citation, and it lists these properties.

*Fix:* add items routed to RP.0, beside GH19's function-field height items.

### 5. Density of prime-to-p torsion has no item (medium, missing)

§5.3 concludes from the density of A′(K̄)_tor ∖ A′_{e+1}. After E2's correction it needs the stronger fact that prime-to-p torsion is Zariski dense. Nothing states this, and neither library has it.

*Fix:* add an item, routed to A3 as a source.

### 6. The inputs of §4 have no items (medium, missing)

§4 uses the following facts without items:

- **The seesaw principle.** Lemma 4.1(1): "trivial over every fiber … so it lies in π*Pic(S)". No roadmap mentions it.
- **Line bundles trivial on the generic fibre come from the base.** Used in §4.3. PAPER-DIMITROV-GAO-HABEGGER-21/29 routes this to SF.
- **deg[m] = m^{2g}.** Used in Proposition 4.2.
- **Projectivity of 𝒜 → S, with a symmetric, relatively ample, rigidified bundle.** Used in Lemma 4.1(3), Proposition 5.4 and the application of Proposition 2.1. PAPER-GAO-HABEGGER-19/14 routes this to A2.

*Fix:* add the four items and route them as sources.

### 7. Lemma 3.7's "polarization of K/k′" (low, missing source issue)

§1.1 defines polarizations only over an algebraically closed field, and it requires the model to be normal. The proof of Lemma 3.7 shows only that H is geometrically integral. Proposition 3.1 then uses H_{k̄_i} as the model.

*Fix:* record the gap as source issue E19. Pass to the normalization of H_{k̄_i}; the heights are unchanged by the projection formula.

### 8. Serre multiplicities and associativity (low, missing)

The paper defines multiplicities by Serre's Tor formula. Proposition 2.4's proof also uses associativity. SF.5's text names intersection products but not these facts.

*Fix:* name both in the note, mark them missing, and add them to route 2 as a source.

### 9. The owner of the pencil blow-up is scoped to characteristic 0 (low, error)

Route 2 builds the pencil blow-up on R09.7a. R09.7a is part of R09.7, whose stated scope is characteristic 0. LPV.3's smooth-axis pencil, which is the special case, is not mentioned.

*Fix:* SF.4 must supply the blow-up in every characteristic, and LPV.3 should be named as the special case.

### 10. Scanlon is missing from the prerequisites (low, missing)

The review's note tells the blueprint to derive Theorem 5.1 from Scanlon's Theorem 2.2, but his paper is not in `prerequisites`.

*Fix:* add it.

## What was not done

- The Inventiones text could not be collated.
- I did not open Lang's *Fundamentals*, Hrushovski 2001 or Pink–Roessler 2004.
- No Lean was written or run.

The JSON's `checked` list records every check in detail.
