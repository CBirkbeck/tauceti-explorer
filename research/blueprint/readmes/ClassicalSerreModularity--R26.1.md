# Classical Serre Modularity: conductor one and the good-dihedral induction

This is the target-level blueprint for R26.1–R26.6 and R27.1–R27.2. The eight stages are **planned**. No stage is closed and no declaration is claimed implemented. The remaining source boundaries and supplier contracts below are part of the specification: in particular, the corrected prime-conductor argument still needs identification in Khare's published Duke edition and the ordinary CM-dihedral lifting branch still needs its correction.

The main conductor-one theorem is Khare's: a continuous odd absolutely irreducible two-dimensional representation of G_Q over an algebraic closure of a finite field, unramified outside its residual characteristic p, arises from a level-one eigenform of its Serre weight. The first part constructs two linked compatible systems, changes a nebentype in a permitted coset, and lowers the weight at the return characteristic. The second part specifies KW's good-dihedral local condition, the image protection it provides, and the implication W_r ⇒ L_r. The latter induction fixes the number r of conductor primes and decreases the residual characteristic. These are different induction measures and different modularity conclusions.

## Conventions and existing objects

All representations are continuous. A residual representation over F̄_p has finite image, hence can be defined over a finite field F; changing that field is an explicit scalar-extension operation. Oddness means determinant −1 at complex conjugation. In characteristic two this determinant condition alone imposes no additional sign constraint. S-type means odd and absolutely irreducible, as in KW. A reduction at a different characteristic need not remain irreducible; every use of a compatible system includes the chosen invariant lattice, reduction and semisimplification contract.

N is the prime-to-characteristic Artin conductor, a positive integer. Its exponent at a prime is not the number of prime divisors of N. The Serre weight is the classical weight of the residual representation, with the local recipe and cyclotomic twist conventions supplied by R15.4–R15.6. The normal range 2≤k≤p+1 is obtained after twisting. Returning to the original representation requires restoring that twist and using the weight/level optimisation theorem. At conductor one, oddness and the determinant recipe imply that k is even.

χ_p denotes the p-adic cyclotomic character, χ̄_p its reduction, and ω_p the Teichmüller lift of χ̄_p. A Teichmüller twist of a characteristic-zero lift and a cyclotomic twist of a residual representation are separate operations. ε is the Teichmüller lift of det(ρ̄)χ̄_p^(1−k). Embeddings into each completion, decomposition/inertia inclusions and coefficient extensions are fixed consistently. A compatible-system transfer requires the particular local Weil–Deligne assertions exported by its supplier; weak compatibility by itself supplies no extra local type.

“Modular” in a residual lifting argument permits the reducible odd branch in the source's convention. The final “arises from” theorem for S-type representations asks for an attached eigenform witness with the prescribed weight and level. The BCDT Introduction separates modularity from strong modularity: a semisimplified residual representation of a cuspidal eigenform and one at optimal prime-to-p level are distinct contracts. R15.6 and R19.1 supply the notions; R20.5–R20.6 supply optimisation. The stated equivalence between these modularity notions is restricted to ℓ≥3. Reading the introduction does not certify the rest of BCDT's proof here.

At Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174, matrix GL₂ is already `Matrix.GeneralLinearGroup (Fin 2) K`, the units of the matrix ring. `Nat.maxPrimeFac` is KW's greatest-prime-divisor function Q: Q(1)=1, and its maximum-characterisation theorem is used only for n>1. The nonzero hypotheses in its product theorem and nonzero-exponent hypothesis in its power theorem are retained. `Nat.primeCounting n` counts primes ≤n; prime-counting at real x means its value at the natural floor of x. None of these objects is defined a second time.

The reviewed library audit and commit-qualified reads at Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 identify existing modular-form and abelian-variety carriers. They do not provide the assembled canonical G_Q representation, Artin conductor, Serre weight and attached-newform witness needed for the headline signatures. The suggested file imports only pinned Mathlib modules. Its algebraic good-dihedral adapter uses supplied inertia and conductor parameters; an arbitrary number N is not silently made an Artin conductor. Its omission ledger names every unexpressible definition/API/test and the required interface. In particular, there are no proposition fields standing in for conductor, weights, lift types or modularity.

## Ownership and structural repairs

The ownership boundaries of RS-06 are as follows. Generic global deformation presentations are R04.3's work; prescribed lifting and the Böckle application are supplied by R24.3. Generic matrix/image classification is R01.4's work. Odd and dyadic solvable modularity are R17.5 and R17.6's work, with exact level/weight supplied by R20.5. The normalized bad-dihedral weight computation belongs to R15.4. The mixed node `R27.1/dickson-and-the-dyadic-solvable-refinement` is a stable source alias with the component boundaries below. Its components are consumed from their RS-06 owners, never exported as a single early theorem that assumes later modularity results.

The good-dihedral prefix requires a stage split. R27.1a should contain Definition 2.1, Lemma 6.3 and the Chebotarev choice Lemma 8.2; R27.1b should contain the later good-dihedral insertion. Delete R27.1's inherited R26.6 requirement from the early prefix, as well as its unrelated late modularity prerequisites. R27.1a uses R01.4/R01.5, the early R15.4 recipe, the R24.5/R24.6 compatible-system operations and the existing Tau Ceti Chebotarev Layer 10. R26.6 remains an input to R27.3's W₁ initial case. Repoint the RS-06 edges into R33.2, R33.3 and R33.6 from R27.1 to its early prefix. A stage-level ancestor check must then find no R26.x ancestor of R33.1–R33.5.

The packet records this stage separation as a restructuring proposal. Its application includes the ancestor check above; node-level independence does not erase a whole-stage prerequisite.

The two existing sibling nodes remain unique in `ClassicalSerreModularity--R27.3`: `R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes` and `R27.1/good-dihedral-prime-insertion`. Lemma 8.2's assumptions include coefficients in the prime field F_p, p≡1 mod4 and nonsolvable image. Its congruences are simultaneous Chebotarev conditions in compatible composita, not independent appeals whose solutions are assumed to coincide. The insertion node retains its prescribed-lift dependencies. This packet imports those nodes instead of rewriting them.

Integral tame Barsotti–Tate classification belongs at R07.5 after R07.4 descent. R15.4 supplies the integer Serre-weight recipe, not an integral classification theorem. Savitt Theorem 6.11, Corollary 6.15 and Remark 6.17, together with Breuil–Mézard Proposition 6.1.1, are requested at R07.5; the consuming R24.6 comparison needs an explicit R07.5 edge. Corollary 6.15's stable-lattice/trivial-endomorphism condition is not discarded. Remark 6.17 extends the semisimplification calculation in its stated range, not a classification of every lattice. For the odd tame niveau-one type over Q_p(μ_p), a reducible residual representation forces an ordinary lift up to Teichmüller twist. This is not an assertion about arbitrary potentially Barsotti–Tate types or p=2.

R26.3 is the single owner of the odd auxiliary-prime estimate. R27.2 imports it and owns its dyadic exponent selection and characteristic induction. Its original node id is retained as an application, avoiding a second general prime estimate. The exponent is e; r continues to count conductor primes. KW's repeating decimal is 22/15, not the finite decimal 1.46.

## Source editions and proof obligations

Khare's public arXiv v1 is the 5 April 2005 preprint. Its statements use Propositions 2.1, 2.2 and 3.1; local reduction/lifting uses Lemmas 5.2–5.4 and Corollary 5.5. KW I uses the published Duke numbering when correcting Corollary 1.2: Theorem 5.1(1), Theorem 6.1(2), and the proof of Theorem 5.1(3 ii). These locators cannot be inferred from the preprint's Proposition 3.1. The Duke PDF was not obtained; its edition crosswalk is an open source obligation.

The published KW Annals paper is *On Serre's conjecture for 2-dimensional mod p representations of Gal(Q̄/Q)*, Annals 169 (2009), 229–253. The older Theorem 4.1(ii)/§5.2 references in Khare correspond to published Theorem 5.2(ii)/§6.2. The former is a **semistable**, weight-two nonexistence theorem for p>2 and prime conductor 2,3,5,7,13. It is not a theorem for arbitrary conductor-two inertia. For q=2, the prime-to-p conductor forces p odd. Artin exponent one gives tame inertia with a fixed line; Frobenius stabilises the quotient character and forces χ=χ², hence χ=1. Thus inertia is unipotent of p-power order, as required by Annals Definition4.1. The local inference is requested from R01.5 and the abelian-variety realisation/reduction contract from R25.5. R25.4 supplies Schoof; the conductor-two residual consequence is this stage’s application. The corrected all-characteristic statement is KW Corollary8.1(i).

| Obligation | Exact result consumed | Owner and boundary |
| --- | --- | --- |
| 1 | Minimal ordinary weight-two lift, p>3, 2≤k≤p+1, k≠p | R26.2 applies R08/R24; ordinary endpoint checked separately |
| 2 | Changed nebentype at q with p^e∥q−1 | R26.2; exponent remains in the original character coset |
| 3 | Compatible systems and their stated local types | R24.5–R24.6, applied at R26.2 and R27.2 |
| 4 | Reducible tame potentially BT ⇒ ordinary up to twist | R07.5; BM Proposition 6.1.1 checked, integral calculations remain a supplier obligation |
| 5 | Solvable, ordinary and nonordinary modularity lifting | R17/R21/R22; CM-dihedral correction remains open |
| 6 | Prime inequalities and all finite initial values | R26.3; Rosser–Schoenfeld proof boundary remains explicit |
| 7 | Every terminal row and its degenerate branches | R26.5; imports R25 arithmetic base cases |
| 8 | Weight/level optimisation and integral Hecke finiteness | R20 and R15.3; final “arises from” and finiteness outputs |
| 9 | Good-dihedral image protection | R27.1 early prefix; no final modularity theorem used |
| 10 | Fixed-r characteristic induction, including final third system | R27.2; W_r ⇒ L_r, not the later double induction |

The source-version register at the end gives public URLs and exact hashes. The main scoped Khare and KW statements and proofs were re-fetched and checked. Böckle's appendix supplies a separate primary source, not an appendix assumed to be present in the arXiv text. Savitt v3 is a corrected 2010 author version. Ribet's Proposition 2.2 was read: it assumes semistability and cyclotomic determinant. Dieulefait–Pacetti v2 Lemma 1.14 gives the general normalized bad-dihedral weight split; the analogous inertia argument is imported through R15.4, rather than falsely applying Ribet's narrower theorem directly.

Rosser–Schoenfeld's displayed inequalities on p.69 were read; their analytic proof and published finite verification tables were not. The blueprint gives the exact arithmetic reduction to those inequalities but records this remaining proof boundary. Breuil–Mézard's Proposition 6.1.1 was obtained and read at printed pp.67–68. For odd p, non-scalar principal tame type ω^i⊕1 (1≤i≤p−2) and Hodge–Tate weights {0,1}, it gives the residual alternatives for any invariant lattice, without an endomorphism premise. The scalar crystalline weight-two case is instead covered by Proposition 4.1.1, since 2<p, including p=3. This does not discharge the later integral calculations in §6. Skinner's unpublished correction was not obtained. A secondary citation never counts as a reading of its primary proof.

## Arithmetic and local transitions to check

For the odd auxiliary prime, write ℓ^e=2m+1∥P−1. The required integer inequality is (m+1)P+m≤(2m+1)p. It bounds both returned weights j+2 and P+1−j when m(P−1)/(2m+1)<j≤(m+1)(P−1)/(2m+1). The interval is half open and has the length of one admissible exponent-coset spacing. A nebentype is selected in that coset, not at an arbitrary conveniently small exponent.

Khare v1 states a uniform Chebyshev π(x) bound that fails: its upper bound at 31 is below 10 while π(31)=11, and at 100 is below 24.1 while π(100)=25. E11 records this proof-affecting discrepancy. The replacement uses Rosser–Schoenfeld π(x)>x/log x for x≥17 and π(x)<1.25506 x/log x for x>1 to obtain the next-prime ratio <22/15 for p≥31. The logarithmic comparison has positive margin at 31 and increases thereafter.

For the large range use π(x)>x/(log x−1/2) for x≥67 and π(x)<x/(log x−3/2) for x>exp(3/2). The ratio 61/50 works for p≥21591. Two consecutive steps have ratio at most 3721/2500<1499/1000; at most one of two successive odd primes above 5 is Fermat, by Bertrand and the spacing of Fermat numbers. Thus the least non-Fermat P satisfies the needed inequality. For 5≤p≤21591 an exhaustive sieve checks all 2,422 input primes and the exact odd prime powers of P−1; the largest P needed is 21599. Implementation must replace this external computation with certified finite decisions and primality/factorization/minimality checks. It is evidence for the plan, not a formal proof.

The terminal rows are P=7,11,19,29,31 with foils 3,5,3,7,5. They return respectively to weights {4,6}, {6,8}, {10,12}, {14,16,18}, {14,20}. At P=29, use j=16 for k=22,26,30 and j=14 for k=24,28. At P=31, k=32 is a semistable endpoint and its allowed exponents are multiples of 6; the printed j=16 is inadmissible. j=18 is in (12,18] and returns to 20 or a twist of weight14. The rows below expose each full branch, not only these numerical equalities.

For KW's next-prime proof the Fermat case keeps the actual next prime P. With 2^e∥P−1 and e≥4, use (2^(e−1)+2)P+(2^(e−1)−2)≤2^e p. The dyadic exponent interval is closed, and an even i is chosen. The small pair (13,17,e=4) gives 176<208, so the bound is strict. This route is distinct from Khare's skip of a Fermat prime.

The good-dihedral inertia character has exact nontrivial order t^a, a>0, for an odd prime t dividing q+1 and strictly exceeding max(Q(N/q²),5,p). The local type is ψ⊕ψ^q after change of basis. q≡1 mod8, and q≡1 mod s for **every prime s≤max(Q(N/q²),p)**. Equality at the endpoint matters. For p=7 and q=241, the congruences at 2,3,5 and modulo8 hold; the one at 7 fails, so N=9·241² gives a useful discriminating non-example. An exact-order character cannot be trivial, and changing basis cannot change the predicate.

The local Frobenius lift calculation uses α−β=γ(c−1) and αβ=ψ₀. Its equation is β²+βγ(c−1)−ψ₀=0, with a plus sign. At an odd residual prime its derivative at the repeated residual root r is 2r≠0. E13 records the erroneous minus sign; α=3, β=2, γ=1, c=2, ψ₀=6 separates the two formulas.

For fixed normalized weight k, Khare Corollary 5.5(i) changes to a characteristic q≥k−1. Its part (ii) requires the full level-one theorem at the chosen characteristic, not merely modularity in a bounded weight range there. A crystalline lift of general weight k consumes R24 and published Annals Theorem 3.3/Theorem 4.2(i), rather than the weight-two Proposition 3.1. Before applying a cyclotomic-irreducibility lifting theorem, handle the dihedral branch through R17/R20. At a ramified foil the bad-dihedral weight computation comes from the general normalized local lemma, not a conductor-one classification.

Finally, in KW's induction a returned representation of reduced weight at P is still in characteristic P. It does not yet satisfy the induction hypothesis. The third compatible system reduces at the predecessor p. If p divides the conductor, replace that prime by P and keep at most r prime divisors; otherwise use the crystalline lift with no new prime. Image protection persists throughout. This final reduction is stated explicitly in the node below.

## Declaration specifications

The 36 stable declaration ids below specify the mathematical work. All retain implementation status `unchecked`. The two definitions have 16 API entries and 11 discriminating tests in total; the suggested file’s omission ledger identifies the entries that cannot yet be typed against the canonical suppliers. Each construction/proof list specifies a dependency-aware plan, not a claim that its suppliers or implementation are complete.

### R26.1. Statement and source contracts

#### Khare's level-one theorem, with the exact sense of 'arises from'

**Theorem.** `ClassicalSerreModularity:R26.1/level-one-theorem-and-the-meaning-of-arises-from`. Let rho-bar: G_Q -> GL_2(F) be continuous, absolutely irreducible, two-dimensional, odd (det rho-bar(c) = -1), with F a finite field of characteristic p, and suppose rho-bar is unramified outside p, i.e. N(rho-bar) = 1. Then rho-bar arises from S_{k(rho-bar)}(SL_2(Z)) with respect to an embedding iota: Qbar -> Qbar_p. 'Arises from a newform f' means: there is an integral model rho: G_Q -> GL_2(O) of the p-adic representation rho_f attached to f, with O the ring of integers of a finite extension of Q_p, such that rho-bar is isomorphic to the reduction of rho modulo the maximal ideal of O. The weight is Serre's k(rho-bar) and the level is N(rho-bar) = 1; conductor one does not assert that the p-adic lift is unramified at p.

**Input conditions.**

- p is odd throughout the proof; the cases p = 2 and p = 3 of the level-one statement are due to Tate and to Serre respectively and are cited, not reproved
- the theorem is for GL_2 over Q; no analogue for other base fields or higher rank is claimed
- the embedding iota_p: Qbar -> Qbar_p is fixed in advance and the statement is relative to it
- the modularity lifting inputs used are restricted: either the p-adic lift is crystalline at p of weight k <= p+1 (ordinary when the weight is p+1), or it is of Hodge-Tate weights (1,0) and Barsotti-Tate over Q_p(mu_p)

**Construction/proof.**

1. Khare uses the inductive method proposed in Theorem 5.1 of the joint Annals paper, and adds a new 'weight reduction' technique that changes the inductive step.
2. He uses the results of the Annals paper for weights 2, 4, 6, and after that proves the level-one case without further appeal to classification results for abelian varieties; the only such input that remains is the nonexistence of a semistable abelian variety over Q with good reduction outside 5 (Fontaine, Schoof, Brumer-Kramer).
3. Taylor's potential modularity and Bockle's deformation-theoretic appendix result are used to construct the minimal and non-minimal lifts; Dieulefait's and Wintenberger's arguments refine them into compatible systems.
4. At changes of prime separate reducible, irreducible bad-dihedral, and cyclotomically absolutely irreducible solvable residuals. The first two use ordinary distinguished lifting (with the recorded CM correction gap); the last uses solvable residual modularity and the appropriate R22 lifting theorem. Breuil–Mézard/Savitt supply local ordinarity only for the specified reducible tame type, not from solvability alone.
5. Kisin's potentially Barsotti-Tate theorem is used only when the p-adic lift is locally at p Barsotti-Tate over Q_p(mu_p).

**Imports.**

- `ClassicalSerreModularity:R26.6/level-one-proof-assembly`
- `AlgebraicModularFormsAndSerreWeights:R15.6`

**Acceptance.**

- Check the p = 2 and p = 3 level-one cases separately against Tate's and Serre's arguments rather than inheriting them from the odd-p induction
- Check that the produced newform has weight exactly k(rho-bar) and level exactly 1, and that the isomorphism is with the residual semisimplification for the chosen prime of O

**Source locators.**

- khare-level-one: p. 2 of the preprint. Theorem 1.1.
- khare-level-one: §1.1, p. 2 of the preprint. p = 2, 3 are Tate's and Serre's.
- kw-serre-modularity-I: §1, p. 2 of the preprint. The meaning of 'arises from'.
- bcdt-modularity: Introduction, author-copy p.2 (published pp.844–845). Modularity versus exact Serre-weight/level modularity; canonical notions are owned by R15/R19 and optimisation by R20.

**Atlas planet.** Khare's level-one theorem

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/LevelOne`, namespace `TauCeti.SerreConjecture`

#### Corollary 1.2 (conductor a prime, weight 2) and the correction of its proof in KW I

**Theorem.** `ClassicalSerreModularity:R26.1/corollary-1-2-conductor-a-prime-and-its-corrected-proof`. For an odd irreducible two-dimensional residual representation of G_Q of Serre weight 2 and prime conductor q, Khare Corollary 1.2 gives an attached form in S_2(Gamma_1(q)) when p>2. KW I Corollary 8.1(i) includes p=2 as well. Its corrected proof first disposes of dihedral projective image by Lemma 6.2 and of q=2 using the earlier Annals result. For the remaining cases, Khare’s published Theorem 5.1(1) supplies an almost strictly compatible weight-two system, minimal at q and with unramified Weil–Deligne parameters away from q. At the q-adic member the relevant local alternatives are semistability with nonzero monodromy, or crystallinity over Q_q(mu_q). Apply the level-one theorem to its residual representation, allowing the source’s reducible modularity convention, then the published Theorem 6.1(2) and transfer back. The semistable comparison uses T. Saito; the other local comparison uses the proof of published Theorem 5.1(3 ii). Theorem 5.1(3) alone does not cover p not dividing q−1. These are Duke-numbered locators, unavailable in arXiv v1; the ordinary dihedral lifting branch also retains Skinner’s unread correction as a supplier gap.

**Input conditions.**

- rho-bar irreducible and odd with k(rho-bar) = 2 and N(rho-bar) = q prime
- Khare's version additionally assumes p > 2; KW I's Corollary 8.1(i) does not, and its proof imports the case q = 2 from [22] = the KW Annals paper
- one may assume the projective image of rho-bar is not dihedral; otherwise KW I Lemma 6.2 applies directly
- the final step uses (2) of Theorem 6.1 of [24] = Khare, Duke Math. J. 134 (2006); the copy of [24] read here is the arXiv v1 preprint, which has no Theorem 5.1 or 6.1 (its compatible-system result is Proposition 3.1), so these corrected references cannot be resolved from it
- KW I's [41] is C. Skinner, 'Nearly ordinary deformations of residually dihedral representations' ('to appear'; listed as a 2009 preprint by Allen, arXiv:1301.1113), which KW I call a correction to Skinner–Wiles 2001 ([40]); it is unpublished and was not read (a gap), and it concerns the dihedral case of OrdinaryAutomorphicFormsAndModularityLifting/E11

**Construction/proof.**

1. Reduce to non-dihedral projective image via Lemma 6.2.
2. Build the compatible system by Theorem 5.1(1): weight 2, unramified Weil-Deligne parameter away from q, rho_p a minimal lift at q.
3. Split on the shape of r_q: semistable with nontrivial monodromy, or unramified after restriction to Q_q(mu_q).
4. Use the level-one theorem to get modularity of rho-bar_q (which may be reducible), and apply (2) of Theorem 6.1 of [24] (Khare, Duke numbering; references to Skinner-Wiles augmented by Skinner's correction [41]) to rho_q; the semistable weight-2 property of rho_q comes from T. Saito [36].
5. Transfer modularity back along the compatible system.

**Imports.**

- `ClassicalSerreModularity:R26.6/corollary-1-2-proof`
- `AlgebraicModularFormsAndSerreWeights:R15.6`

**Acceptance.**

- Check the case p | q-1 versus p not dividing q-1 separately, since this is exactly where Khare's original reference fails
- Check that the conclusion is a form in S_2(Gamma_1(q)) with the correct nebentype, not merely S_2(Gamma_0(q))

**Source locators.**

- khare-level-one: p. 3 of the preprint. Corollary 1.2 (with p > 2).
- kw-serre-modularity-I: §8.3, proof of Corollary 8.1, p. 16 of the preprint. KW I's corrected reference.
- kw-annals: Published Definition4.1, Theorem4.2(ii), pp.243–244; Theorem5.2(ii), p.247; §6.2, pp.250–251 (older cited Theorem4.1(ii)/§5.2). The q=2 case first needs the conductor-one-at-2 ⇒ unipotent local inference. Annals Theorem5.2(ii) then excludes this semistable weight-two case; its abelian-variety proof imports Schoof through R25, not an arbitrary conductor-two theorem from R25.

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/LevelOne`, namespace `TauCeti.SerreConjecture`

#### Böckle's appendix as Khare uses it: the application contract

**Theorem.** `ClassicalSerreModularity:R26.1/bockle-appendix-minimal-deformation-ring-presentation`. Khare's level-one argument applies Böckle's appendix to the minimal deformation ring R_∅ and to R_Q^{α-new}, and this node records exactly what must be verified for that application. The presentation (Proposition 1), Lemma 2 (finite with no more relations than variables gives a finite flat complete intersection) and Theorem 1 (an auxiliary R_Q ≅ T_Q gives R_∅ ≅ T_∅) are PotentialModularityAndCompatibleSystems R24.3/bockle-presentation, /finite-presentation-complete-intersection and /bockle-minimal-r-equals-t, with the generic presentation at GlobalGaloisDeformations R04.3. The contract: (i) ρ̄ is odd (used once, in the Euler-characteristic count); (ii) Corollary 1 — Δ_ℓ = 0 in the four cases used: no ramification allowed at ℓ, no condition at ℓ, the minimal condition at a prime where ρ̄ ramifies, and the Q-new condition at a prime of Q (where R_{X,ℓ} = 𝒪⟦T⟧, implicitly shown by Ramakrishna); at p, Δ_p = 0 for finite or Selmer conditions (Darmon–Diamond–Taylor §2) except when ρ̄|_{G_p} is decomposable and flat, where Lemma 1 (after Ramakrishna's thesis) gives R = W(k)⟦X₁, X₂⟧; (iii) Corollary 2: R_Q finite over 𝒪 makes R_∅ a finite flat complete intersection; (iv) Theorem 1 needs T_Q reduced (the choice of Q) and Carayol's conductor theorem. The statement is a contract, not a second proof of the appendix.

**Input conditions.**

- d and Ad_X(rho) are tied to whether X fixes a determinant: d = 0 and Ad_X = Ad^0 if the determinant is fixed, otherwise d = 1 and Ad_X = Ad
- Proposition 1's proof uses that rho is ODD, through the formula of [1], Lem. 5.5(ii); oddness is not decorative here
- Theorem 1's proof needs T_Q and T_empty finite flat over W(k) ('standard fact') and reduced - T_Q by the choice of Q - and uses Carayol [3] (Ann. ENS 1986) to conclude that a newform unramified at the primes of Q has conductor prime to Q
- the case where rho restricted to a decomposition group at p is decomposable and flat is NOT covered by the generic computation Delta_p = 0 and is handled by a separate Lemma 1 following Ramakrishna's thesis
- RS-06 moves the generic presentation to GlobalGaloisDeformations R04.3 and the prescribed-lift application to PotentialModularityAndCompatibleSystems R24.3; this node keeps its id and the contract (checkpoint 2)

**Construction/proof.**

1. Verify (i)–(iv) for Khare's minimal and Q-new conditions, case by case as in Corollary 1 and Lemma 1.
2. Apply PotentialModularityAndCompatibleSystems R24.3/bockle-presentation, /finite-presentation-complete-intersection and /bockle-minimal-r-equals-t.
3. Lemma 1 (decomposable flat at p): the flat lifts of determinant ε are reducible (Conrad), the tangent space has dimension 2, and a rigid-analytic fibre argument shows the ideal of relations is 0.

**Imports.**

- `PotentialModularityAndCompatibleSystems:R24.3/bockle-presentation`
- `PotentialModularityAndCompatibleSystems:R24.3/finite-presentation-complete-intersection`
- `PotentialModularityAndCompatibleSystems:R24.3/bockle-minimal-r-equals-t`
- `GlobalGaloisDeformations:R04.3/local-to-global-presentation`

**Acceptance.**

- Check that the oddness of rho is used exactly once, in the dimension count of Proposition 1, and that removing it breaks n + Delta = j
- Check the excluded decomposable-and-flat case at p against Lemma 1 rather than assuming Delta_p = 0 uniformly

**Source locators.**

- bockle-appendix-2003: p. 1. Theorem 1.
- bockle-appendix-2003: p. 2. Proposition 1.
- bockle-appendix-2003: proof of Proposition 1, p. 2. Oddness in the proof.

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/LevelOneLifts`, namespace `TauCeti.SerreConjecture`

### R26.2. Prescribed lifts and compatible systems

#### Flatness of the deformation rings of prescribed lifts

**Lemma.** `ClassicalSerreModularity:R26.2/lifting-method-flatness`. (Khare §2.1, after KW Annals §2.) Let p be odd, ρ̄ : G_ℚ → GL₂(F) odd irreducible with non-solvable image, 2 ≤ k(ρ̄) ≤ p + 1 and k(ρ̄) ≠ p, and let R be the global deformation ring of lifts with fixed determinant, unramified outside a fixed finite set, with prescribed local conditions. If (a) each local ring R_ℓ (ℓ ≠ p) is a flat complete intersection over 𝒪 of relative dimension h⁰(D_ℓ, Ad⁰ρ̄) and R_p one of relative dimension h⁰(D_p, Ad⁰ρ̄) + 1, and (b) R/(π) is finite, then R is finite flat and a complete intersection over 𝒪; in particular ρ̄ has a lift of the prescribed type. Finiteness of R/(π) follows from finiteness of R_F/(π) for a totally real Galois F of even degree over which ρ̄|_{G_F} is modular by a suitable cuspidal π (Taylor), through R_F ≅ T_F (KW Annals Lemma 2.4).

**Input conditions.**

- Non-solvable image of ρ̄ (so ρ̄|_{G_F} has non-solvable image for totally real F); k(ρ̄) ≠ p; for p = 3 an auxiliary prime handles non-neatness.

**Construction/proof.**

1. Import the prescribed-lift and compatible-system contracts from R24 and verify the stated local hypotheses. This node records their application in the level-one argument; generic existence and compatibility remain owned by R24.
2. Böckle's Proposition 1 turns the local dimension counts into a presentation 𝒪[[X_1, …, X_r]]/(f_1, …, f_s) with s ≤ r.
3. Taylor's potential modularity gives F and π; R_F ≅ T_F (Fujiwara / Taylor §3) makes R_F finite over 𝒪; the orders of ρ_R(I_ℓ) and ρ̄(I_ℓ) agree for the prescribed lifts, so ρ_R|_{G_F} specialises ρ_{R_F} and R/(π) is finite (KW Annals Lemma 2.4).
4. A finite 𝒪-algebra with a presentation by at most r relations in r variables is a flat complete intersection.

**Imports.**

- `ClassicalSerreModularity:R26.1/bockle-appendix-minimal-deformation-ring-presentation`
- `PotentialModularityAndCompatibleSystems:R24.3/kw-annals-minimal-lifts`
- `PotentialModularityAndCompatibleSystems:R24.3/finite-presentation-complete-intersection`
- `PotentialModularityAndCompatibleSystems:R24.5`
- `GL2ModularityLifting:R22.1`
- `PotentialModularityAndCompatibleSystems:R24.3/required-lift-types`

**Acceptance.**

- Existence of a lift comes from flatness, not from an explicit construction.

**Source locators.**

- khare-level-one: §2.1, p. 8 of the preprint. §2.1.
- khare-level-one: §2.1, p. 11 of the preprint. The local criterion.

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/LevelOneLifts`, namespace `TauCeti.SerreConjecture`

#### Minimal weight-two lifts of ordinary residual representations

**Theorem.** `ClassicalSerreModularity:R26.2/minimal-weight-two-lift`. (Proposition 2.1.) Let p > 3 and ρ̄ odd absolutely irreducible with 2 ≤ k(ρ̄) ≤ p + 1, k(ρ̄) ≠ p, ordinary at p. Then ρ̄ has a lift ρ minimal of weight 2: minimal at every ℓ ≠ p, with determinant εω_p^{k(ρ̄)−2}χ_p, and ρ|_{I_p} ≅ (ω_p^{k−2}χ_p *; 0 1) when ρ̄|_{I_p} ≅ (χ̄_p^{k−1} *; 0 1), Barsotti–Tate when k(ρ̄) = 2. In the conductor-one induction the k=p+1 endpoint uses the semistable weight-two branch; for 2<k<p+1 the tame character ω_p^(k−2) is nontrivial and the lift becomes Barsotti–Tate over Q_p(μ_p).

**Input conditions.**

- p > 3; odd absolutely irreducible residual representation, ordinary at p; 2≤k≤p+1 and k≠p. The later level-one application further assumes N=1.

**Construction/proof.**

1. Import the prescribed-lift and compatible-system contracts from R24 and verify the stated local hypotheses. This node records their application in the level-one argument; generic existence and compatibility remain owned by R24.
2. Solvable image: Serre's conjecture is known in its refined form, and a mod p ordinary eigenform of weight k(ρ̄) also arises in S₂(Γ₁(N) ∩ Γ₀(p), ω^{k(ρ̄)−2}) (Gross, Edixhoven).
3. Otherwise apply lifting-method-flatness: the local ring R_p of lifts of the given ordinary shape with fixed determinant (Barsotti–Tate if k(ρ̄) = 2) is smooth of relative dimension 1 + h⁰(D_p, Ad⁰ρ̄) (Taylor E3–E4; LocalGaloisDeformationRings R08.6).

**Imports.**

- `ClassicalSerreModularity:R26.2/lifting-method-flatness`
- `LocalGaloisDeformationRings:R08.6`
- `ArithmeticGaloisRepresentations:R01.4`
- `PotentialModularityAndCompatibleSystems:R24.3/required-lift-types`
- `GL2AutomorphicRepresentationsAndTransfer:R17.6`
- `SerreWeightAndLevelOptimisation:R20.6`

**Acceptance.**

- Retain the k=2 Barsotti–Tate condition, the conductor-one k=p+1 semistable branch, and the nontrivial tame nebentype for 2<k<p+1; trivial finite-order nebentype alone does not distinguish crystalline from semistable.

**Source locators.**

- khare-level-one: §2.2, p. 12 of the preprint. Proposition 2.1.

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/LevelOneLifts`, namespace `TauCeti.SerreConjecture`

#### The local lifting ring at a prime with prescribed nebentypus is smooth

**Lemma.** `ClassicalSerreModularity:R26.2/local-ring-at-q-smooth`. (Khare §2.3, with Böckle's calculation.) Let p and q be distinct odd primes with p^r ∥ q − 1 (r > 0), ρ̄|_{I_q} ≅ (χ̄ *; 0 1) ramified, χ̄ a mod p character of Gal(ℚ_q(μ_q)/ℚ_q) with Teichmüller lift χ, η_q = ω_q^{(q−1)/p^r}. The versal ring R_q of lifts of ρ̄|_{D_q} with determinant εχ_p^{k(ρ̄)−1}η_q^i and ρ|_{I_q} ≅ (χη_q^i *; 0 1) is smooth over 𝒪 of relative dimension h⁰(D_q, Ad⁰ρ̄) = 1.

**Input conditions.**

- p and q are distinct odd primes; r>0 and p^r exactly divides q−1; ρ̄ is ramified at q with the displayed triangular inertial shape; enlarge the coefficient DVR 𝒪 to contain χ and η_q.

**Construction/proof.**

1. The mod π tangent space has dimension 1 (Wiles' minimal-lift computations).
2. Infinitely many 𝒪-valued lifts: lifts are tame, given by images A of σ_q and B of τ_q with AB A^{−1} = B^q. If χ ≠ 1 take diagonal lifts. If χ = 1 and χ′ = η_q^i ≠ 1, with ρ̄(σ) = (r_F b; 0 r_F), ρ̄(τ) = (1 1; 0 1), seek A = (α γ; 0 β), B = (χ′(τ) 1; 0 1); since B has order dividing q − 1, the relation is AB = BA, i.e. α − β = γ(χ′(τ) − 1); with αβ = ψ this gives β² + βγ(χ′(τ) − 1) − ψ = 0 (the printed minus is E13). The derivative reduces to 2r_F, a unit because p is odd and the residual Frobenius eigenvalue r_F is nonzero; Hensel gives a unique β ≡ r_F for each γ ≡ b: a one-parameter family.
3. If χ′ = 1 this is Taylor's E3.

**Imports.**

- `LocalGaloisDeformationRings:R08.2`

**Acceptance.**

- The only case with non-abelian local image is χ = χ′ = 1.

**Source locators.**

- khare-level-one: proof of Proposition 2.2, p. 15 of the preprint. The printed quadratic has a sign misprint (E13). Its preceding commutation and determinant relations yield the corrected plus sign; the Hensel derivative and smoothness conclusion are unchanged.

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/LevelOneLifts`, namespace `TauCeti.SerreConjecture`

#### Lifts with prescribed nebentypus at an auxiliary prime

**Theorem.** `ClassicalSerreModularity:R26.2/nebentype-lift-at-q`. (Proposition 2.2.) Let p be odd, ρ̄ odd irreducible with non-solvable image, 2 ≤ k(ρ̄) ≤ p + 1, k(ρ̄) ≠ p, with ρ̄|_{I_q} as in local-ring-at-q-smooth. For every integer i there is a lift ρ of determinant εχ_p^{k(ρ̄)−1}η_q^i, minimal outside p, q, crystalline of weight k(ρ̄) at p, with ρ|_{I_q} ≅ (χη_q^i *; 0 1) (nebentypus χη_q^i at q).

**Input conditions.**

- Non-solvable image; used only for k(ρ̄) = 2, ρ̄ unramified outside p, q, and nontrivial nebentypus.

**Construction/proof.**

1. Import the prescribed-lift and compatible-system contracts from R24 and verify the stated local hypotheses. This node records their application in the level-one argument; generic existence and compatibility remain owned by R24.
2. R_p (crystalline of weight k(ρ̄), fixed determinant) is smooth of relative dimension h⁰(D_p, Ad⁰ρ̄) + 1 (Ramakrishna, Taylor; KW Annals Prop. 2.3 for k = p + 1); R_q by local-ring-at-q-smooth; conclude by lifting-method-flatness.

**Imports.**

- `ClassicalSerreModularity:R26.2/lifting-method-flatness`
- `ClassicalSerreModularity:R26.2/local-ring-at-q-smooth`
- `LocalGaloisDeformationRings:R08.3`
- `PotentialModularityAndCompatibleSystems:R24.3/required-lift-types`

**Acceptance.**

- The nebentypus can only be moved within the coset χ·⟨η_q⟩: j ≡ (exponent of χ) mod (q − 1)/p^r.

**Source locators.**

- khare-level-one: §2.3, p. 13 of the preprint. Proposition 2.2.

**Atlas planet.** Lifts with prescribed nebentypus

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/LevelOneLifts`, namespace `TauCeti.SerreConjecture`

#### Placing the lifts in compatible systems

**Theorem.** `ClassicalSerreModularity:R26.2/compatible-system-lifts`. (Proposition 3.1.) (i) For ρ̄ as in minimal-weight-two-lift (p > 3) and a minimal weight-2 lift ρ, there is a weakly compatible system (ρ_λ) over a number field E containing ρ at the place given by ι_p, such that ρ_λ at a place above ℓ > 2 unramified in ρ̄ is Barsotti–Tate at ℓ, unramified outside {ℓ}∪Ram(ρ̄), and has the same inertial Weil–Deligne parameter at p as ρ. (ii) For ρ̄ as in nebentype-lift-at-q with k(ρ̄) = 2 and nontrivial nebentypus χη_q^i = ω_q^j (1 ≤ j ≤ q − 2), there is such a system in which the member above q (via ι_q) is unramified outside {q}∪(Ram(ρ̄)\{p}), unramified at p, Barsotti–Tate over ℚ_q(μ_q) at q; if its residual representation has non-solvable image then its residual representation has weight j + 2, or its twist by χ_q^{−j} has weight q + 1 − j.

**Input conditions.**

- In (i), p>3 and the ordinary residual hypotheses of Proposition 2.1; at the new member ℓ>2 is unramified in ρ̄ (in particular ℓ≠p). In (ii), p is odd (p=3 allowed), the original ρ̄ has non-solvable image, k(ρ̄)=2 and the nebentypus at q is nontrivial. The last weight assertion additionally assumes that the new residual q-adic member has non-solvable image.

**Construction/proof.**

1. Import the prescribed-lift and compatible-system contracts from R24 and verify the stated local hypotheses. This node records their application in the level-one argument; generic existence and compatibility remain owned by R24.
2. Taylor's potential modularity over a Galois totally real F, Brauer induction 1_G = Σ n_i Ind χ_i over solvable Gal(F/F_i), and Arthur–Clozel base change give ρ = Σ n_i Ind(χ_i ⊗ ρ_{π_i}); the same virtual sum at other embeddings is a true representation (PotentialModularityAndCompatibleSystems R24.5–R24.6).
3. (i): Taylor's F is unramified at p and the form is ordinary or Steinberg at p.
4. (ii): over a solvable F″ completing to ℚ_q(μ_q), Barsotti–Tate by Breuil's theorem on finite flat reductions; level raising (Taylor [52]) to a form square-integrable at an auxiliary place; Saito [41] for the inertial parameter; Breuil–Mézard Prop. 6.1.1 and Savitt Thm 6.11 for the weights j + 2 or q + 1 − j.

**Imports.**

- `ClassicalSerreModularity:R26.2/minimal-weight-two-lift`
- `ClassicalSerreModularity:R26.2/nebentype-lift-at-q`
- `PotentialModularityAndCompatibleSystems:R24.5/brauer-induction-system`
- `PotentialModularityAndCompatibleSystems:R24.5/almost-strict-compatibility`
- `PotentialModularityAndCompatibleSystems:R24.6/residual-members`
- `PotentialModularityAndCompatibleSystems:R24.3/required-lift-types`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5`

**Acceptance.**

- The residual weight is determined only up to the twist: j + 2 or q + 1 − j.
- Ramification support for a member above ℓ always allows its own coefficient prime ℓ. The fixed Weil–Deligne support, rather than all member ramification sets literally, is independent of the coefficient prime.

**Source locators.**

- khare-level-one: §3, pp. 16–17 of the preprint. Proposition 3.1.
- khare-level-one: §3, p. 17 of the preprint. The weight statement.

**Atlas planet.** Compatible systems through potential modularity

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/LevelOneLifts`, namespace `TauCeti.SerreConjecture`

### R26.3. Auxiliary primes and weight reduction

#### Khare's prime estimate for the inductive step

**Lemma.** `ClassicalSerreModularity:R26.3/chebyshev-next-prime`. (Khare §4.) For every prime p_n ≥ 31 there are a prime P_{n+1} > p_n, not a Fermat prime (P_{n+1} = p_{n+1}, or p_{n+2} when p_{n+1} is a Fermat prime), and an odd prime power ℓ^r = 2m + 1 exactly dividing P_{n+1} − 1 with P_{n+1}/p_n ≤ (2m + 1)/(m + 1) − (m/(m + 1))(1/p_n) (1). This is the shared odd-prime estimate imported by KW I §7 case (i); write its exponent e, distinct from KW’s conductor-count parameter r. The finite range also supplies p=5,7,11,13,17,19,23,29.

**Input conditions.**

- p_n ≥ 31; the verification for 31 ≤ p_n ≤ 21591 is a finite check (with P = 263 after p_n = 251, since 257 is Fermat).

**Construction/proof.**

1. Use finite-auxiliary-prime-checks for p≤21591.
2. For p≥21591, next-prime-ratio gives P/p<1499/1000≤3/2−1/p; for m≥1 the right side of (1) is at least 3/2−1/p.
3. Since P is not Fermat, P−1 has a nontrivial exact odd prime-power divisor ℓ^e. For the finite range the certificate checks ℓ≤p. In the asymptotic range P<3p/2<2p, and every odd factor ℓ of the even integer P−1 is at most (P−1)/2<p, including after a Fermat skip.
4. The supplied Chebyshev bound is false as a uniform π(x) bound; use the corrected explicit-prime-counting-input.

**Imports.**

- `ClassicalSerreModularity:R26.3/next-prime-ratio`
- `ClassicalSerreModularity:R26.3/finite-auxiliary-prime-checks`

**Acceptance.**

- R26.3 owns the shared odd estimate; R27.2 imports it and owns only its dyadic arithmetic application. Certify the finite range and the replacement Rosser–Schoenfeld derivation rather than the false uniform Chebyshev π bound.

**Source locators.**

- khare-level-one: §4, p. 19 of the preprint. §4.
- khare-level-one: §4, p. 20 of the preprint. The conclusion.

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/LevelOne`, namespace `TauCeti.SerreConjecture`

#### Twisting the Serre weight

**Lemma.** `ClassicalSerreModularity:R26.3/serre-weight-twist`. (Lemma 5.2.) Let τ : G_{ℚ_p} → GL₂(F) have Serre weight k ≠ 2 with k < p. If τ is irreducible and k − 1 = p − k′ (k′ ≥ 0), then τ ⊗ χ̄_p^{k′} has weight k′ + 2 = p + 3 − k; if τ|_{I_p} is split, τ ⊗ χ̄_p^{1−k} has weight p + 1 − k.

**Construction/proof.**

1. Immediate from Serre's recipe for k(ρ̄) (AlgebraicModularFormsAndSerreWeights R15.6).

**Imports.**

- `AlgebraicModularFormsAndSerreWeights:R15.4`

**Acceptance.**

- Used to assume ρ̄ ordinary at p once all weights ≤ p_n + 1 are known.

**Source locators.**

- khare-level-one: §5, p. 21 of the preprint. Lemma 5.2.

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/LevelOne`, namespace `TauCeti.SerreConjecture`

#### The new residual weights fall into the known range

**Lemma.** `ClassicalSerreModularity:R26.3/weight-interval-containment`. (Khare §6.2.) Let p = P_{n+1} and ℓ^r = 2m + 1 satisfy (1) of chebyshev-next-prime. For every integer j with m(p − 1)/(2m + 1) < j ≤ (m + 1)(p − 1)/(2m + 1), both j + 2 and p + 1 − j lie in [2, p_n + 1]; and the half-open interval contains exactly one element of each residue class modulo (p − 1)/ℓ^r, so a nebentypus χη_p^i with j in it can always be chosen.

**Input conditions.**

- p_n and P_{n+1} are odd primes with p_n≥31 and P_{n+1}>p_n; ℓ is odd prime, e≥1, ℓ^e=2m+1 exactly divides P_{n+1}−1, so m≥1 and L=(P_{n+1}−1)/ℓ^e is a positive integer. The auxiliary-prime inequality holds.

**Construction/proof.**

1. (m + 1)(p − 1)/(2m + 1) + 2 ≤ p_n + 1 and p + 1 − m(p − 1)/(2m + 1) ≤ p_n + 1 are both equivalent to (m + 1)p ≤ (2m + 1)p_n − m, i.e. to (1). For the lower bounds use m≥1, P_{n+1}≥3 and the upper interval endpoint, which is at most P_{n+1}−1. These are mathematical proof obligations; the suggested Lean signatures have unproved placeholders.
2. The interval is (mL,(m+1)L] with L a positive integer, so its L integer points give exactly one representative of each residue class modulo L. Choose the representative of the original tame exponent coset; do not choose j independently of that coset.

**Imports.**

- `ClassicalSerreModularity:R26.3/chebyshev-next-prime`
- `ClassicalSerreModularity:R26.2/nebentype-lift-at-q`

**Acceptance.**

- The upper end p + 1 − j < p + 1 − m(p − 1)/(2m + 1) is strict, so the bound (1) with ≤ suffices.

**Source locators.**

- khare-level-one: §6.2, p. 27 of the preprint. The containment.

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/LevelOne`, namespace `TauCeti.SerreConjecture`

#### The well-founded induction on the weight bound

**Theorem.** `ClassicalSerreModularity:R26.3/level-one-induction-scheme`. For B ≥ 2 let S(B) be: every odd irreducible ρ̄ : G_ℚ → GL₂(F̄_ℓ) (any ℓ) with N(ρ̄) = 1 and k(ρ̄) ≤ B is modular. Then S(32) holds (small-weights-table with the base cases), and S(p_n + 1) ⇒ S(P_{n+1} + 1) for the primes p_n ≥ 31 of chebyshev-next-prime. Every recursive appeal in the step is to a weight ≤ p_n + 1 (weight-interval-containment), to weight 2 at level one (excluded, so ρ̄ is reducible), or to solvable image (known); hence the induction is on the bound B, not on the prime, and terminates.

**Input conditions.**

- Corollary 5.5(i) transfers a fixed normalized weight k≤p+1 from characteristic p to q≥k−1. Corollary 5.5(ii) transfers all weights≤p+1 to every q only after the full level-one theorem in characteristic p is proved. A bounded assertion at an arbitrary single characteristic does not suffice.

**Construction/proof.**

1. Measure: the weight bound B ∈ ℕ. The step at P = P_{n+1} treats weights p_n + 2 ≤ k ≤ P + 1 and calls S(p_n + 1) only (for ρ̄″ of weight j + 2 or P + 1 − j) and the two known classes.
2. For the step first prove the full theorem in characteristic P: weights≤p_n+1 follow from S(p_n+1), and the new normalized weights are the ones treated by the step. Then invoke Corollary 5.5(ii) to export S(P+1) to every characteristic. Cyclotomic normalization and restoration are supplied by R15.4; the small-characteristic cases use Tate–Serre.
3. Changing the prime (to the foil ℓ and back to P) does not change B, so it is not itself the decreasing measure.

**Imports.**

- `ClassicalSerreModularity:R26.3/weight-interval-containment`
- `ClassicalSerreModularity:R26.3/serre-weight-twist`
- `ClassicalSerreModularity:R26.4/level-one-lifting-lemma`
- `ClassicalSerreModularity:R26.5/small-weights-table`
- `ClassicalSerreModularity:R26.4/ordinary-reduction-and-parity`
- `AlgebraicModularFormsAndSerreWeights:R15.4`

**Acceptance.**

- This makes the stage's 'well-founded measure' explicit; Khare's text leaves it implicit.

**Source locators.**

- khare-level-one: §6.2, p. 26 of the preprint. The inductive step.

**Atlas planet.** Weight induction for level one

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/LevelOne`, namespace `TauCeti.SerreConjecture`

#### Explicit prime counting input and Khare’s Chebyshev comparison

**Lemma.** `ClassicalSerreModularity:R26.3/explicit-prime-counting-input`. For real x≥17, π(x)>x/log x; for x>1, π(x)<1.25506 x/log x. For x≥67, π(x)>x/(log x−1/2), and for x>exp(3/2), π(x)<x/(log x−3/2). These are Rosser–Schoenfeld (3.3)–(3.6). Khare §4’s claimed uniform A x/log x≤π(x)≤B x/log x for x>30, A≈0.921 and B/A=6/5, is not used as a theorem: π(31)=11 violates its upper bound (E11). If such bounds hold on a specified range, the formal comparison with a>6/5 yields a next-prime bound when p>max(30,a^(6/(5a−6))); this conditional algebra does not repair the false uniform range.

**Input conditions.**

- For the four prime-counting bounds respectively: real x≥17; real x>1; real x≥67; real x>exp(3/2). Use π(x)=Nat.primeCounting(⌊x⌋₊).

**Construction/proof.**

1. Import prime-counting and real logarithm infrastructure; prove the explicit inequalities by the Rosser–Schoenfeld analytic argument and its stated finite checks, with the unread proof boundary recorded as a gap.
2. Compare lower π(ap) with upper π(p); a strict inequality produces a prime in (p,ap].
3. Retain Khare’s B/A=6/5 calculation as a conditional source comparison with its range explicit.

**Imports.**

- `mathlib:Nat.primeCounting`

**Acceptance.**

- π(31)=11 and π(100)=25 refute Khare’s stated upper bound; never feed it unconditionally into weight reduction.
- The strict prime-count inequalities are applied only above their exact thresholds.

**Source locators.**

- rosser-schoenfeld: Theorem 2 and Corollary 1, p.69. Theorem 2 gives the sharper denominator bounds (3.3) and (3.4); Corollary 1 gives the simpler bounds (3.5) and (3.6), all on printed p.69. The four statements and their domains were checked; the analytic proofs and finite verification tables remain outside the reading boundary.
- khare-level-one: §4, p.19. The advertised Chebyshev constants, corrected by E11.

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/PrimeEstimates`, namespace `TauCeti.SerreConjecture`

#### Consecutive-prime ratio for the shared recursion

**Lemma.** `ClassicalSerreModularity:R26.3/next-prime-ratio`. If p≥31 is prime and P is the least prime greater than p, then P/p<22/15 (hence ≤3/2−1/30). If p≥21591, the next two consecutive primes are each at most (61/50) times the preceding one. Since (61/50)^2=3721/2500<1499/1000, the least non-Fermat prime greater than p is <(1499/1000)p.

**Input conditions.**

- p is prime, p≥31 and P is the least prime strictly greater than p. For the sharper two-step comparison assume p≥21591. Bertrand is invoked only at a positive integer, with its actual pinned-library hypotheses.

**Construction/proof.**

1. For a=22/15, use π(ap)>ap/log(ap) and π(p)<1.25506p/log p. Verify a log p >1.25506(log p+log a) at p=31 and monotonicity in log p.
2. For a=61/50 and p≥21591 use the sharper denominators: a(log p−3/2)>log p+log a−1/2. It is sufficient at the lower endpoint and increases thereafter.
3. Among two consecutive odd primes above 5 at most one is Fermat: if both were Fermat, Bertrand supplies an intervening prime (the later Fermat is larger than twice the earlier).

**Imports.**

- `ClassicalSerreModularity:R26.3/explicit-prime-counting-input`
- `mathlib:Nat.exists_prime_lt_and_le_two_mul`

**Acceptance.**

- Distinguish the next prime from the least non-Fermat prime; do not erase the Fermat skip.
- Use the exact repeating decimal 22/15 in KW §7; 1.46 is not its exact rational value.
- The endpoint logarithmic comparisons have positive margins (at p=31 and p=21591); strict rational ratio statements use that a·p cannot be an integer prime at these denominators.

**Source locators.**

- kw-serre-modularity-I: §7, p.12. Consecutive-prime ratio for the shared recursion

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/PrimeEstimates`, namespace `TauCeti.SerreConjecture`

#### Finite auxiliary-prime checks

**Lemma.** `ClassicalSerreModularity:R26.3/finite-auxiliary-prime-checks`. For each prime p with 5≤p≤21591, let P be the least non-Fermat prime greater than p. There are an odd prime ℓ and e≥1 with ℓ^e exactly dividing P−1, ℓ^e=2m+1, and (m+1)P+m≤(2m+1)p. In particular the (p,P,ℓ^e) rows for p≤31 are (5,7,3),(7,11,5),(11,13,3),(13,19,9),(17,19,9),(19,23,11),(23,29,7),(29,31,5),(31,37,9). At p=251 skip 257 and choose P=263, ℓ^e=131.

**Input conditions.**

- p is prime with 5≤p≤21591; P is the least non-Fermat prime strictly greater than p. All odd factors are taken to their exact maximal prime powers.

**Construction/proof.**

1. Use an exhaustive sieve through 21649, with primality certificates for each chosen P and factorization certificates for P−1; check absence of a smaller non-Fermat prime.
2. Compute the maximal odd prime-power divisors, select one satisfying the displayed integer inequality. All assertions have finite bounds, so use decision procedures against Nat.Prime in implementation.

**Acceptance.**

- Check every prime p in the range, not just the nine displayed rows.
- p=251 must not select the Fermat prime 257.

**Source locators.**

- khare-level-one: §4, pp.19–20. Finite auxiliary-prime checks

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/PrimeEstimates`, namespace `TauCeti.SerreConjecture`

### R26.4. Ordinary and degenerate branches

#### Residually reducible potentially Barsotti–Tate lifts are ordinary

**Lemma.** `ClassicalSerreModularity:R26.4/local-reducibility-ordinary`. (Khare Lemma 5.3, in the nonscalar type used in the induction; Breuil–Mézard Proposition 6.1.1.) Let p be odd and V a two-dimensional potentially crystalline representation of G_{ℚ_p} with Hodge–Tate weights {0,1}. After a finite Teichmüller twist, assume WD(V)|I_p≅ω_p^i⊕1 with 1≤i≤p−2, and choose any G_{ℚ_p}-stable lattice T over a sufficiently large coefficient DVR. If T modulo its maximal ideal is reducible, then V is reducible and ordinary up to a power of ω_p. This is the tame niveau-one type becoming Barsotti–Tate over ℚ_p(μ_p) used here; no assertion about arbitrary potentially Barsotti–Tate types is made.

**Input conditions.**

- p odd; Hodge–Tate weights {0,1}; potentially crystalline nonscalar tame niveau-one type ω_p^i⊕1 up to twist with 1≤i≤p−2; a Galois-stable lattice. Proposition 6.1.1 has no End(ρ̄)=F premise (unlike Proposition 6.1.2 and Savitt Corollary 6.15).

**Construction/proof.**

1. In the Breuil–Mézard parameter V(μ,ξ), Proposition 6.1.1(ii) gives an irreducible residual niveau-two representation when 0<v_p(ξ)<1. Thus a reducible residual lattice forces slope 0 or 1, the reducible characteristic-zero endpoint cases (i),(iii). They become ordinary after a Teichmüller twist; the two endpoints are related by twist and Cartier duality.
2. Savitt Theorem 6.11 supplies the corresponding integral classification. For lattices without the trivial-endomorphism condition, use Remark 6.17 only to determine semisimplification; in dimension two reducibility is equivalent to reducibility of semisimplification. The integral calculations remain an R07.5 supplier obligation.

**Imports.**

- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5`

**Acceptance.**

- This is what makes the lifts in the degenerate branches ordinary up to twist, as Skinner–Wiles require.

**Source locators.**

- khare-level-one: §5, p. 21 of the preprint. Lemma 5.3.
- savitt-cdt: Theorem 6.11, pp.34–35; Corollary 6.15(1), p.38. Ordinary and nonordinary reductions of the tame niveau-one type.
- breuil-mezard: §6.1, author-copy pp.67–68, Proposition 6.1.1; standing odd-prime convention in Introduction p.2. Read the nonscalar principal-series setup, the arbitrary stable lattice T, and the three slope cases. The End condition first appears in Proposition 6.1.2, not Proposition 6.1.1.

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/LevelOne`, namespace `TauCeti.SerreConjecture`

#### Level-one lifting and the change of prime

**Theorem.** `ClassicalSerreModularity:R26.4/level-one-lifting-lemma`. (Lemma 5.4, Corollary 5.5.) For odd p, an irreducible p-adic ρ unramified outside p, crystalline at p with Hodge–Tate weights (k − 1, 0), k even, 2 ≤ k ≤ p + 1, with ρ̄ modular, arises from S_k(SL₂(ℤ)). Consequently: (i) if all odd irreducible mod p ρ̄ of level one and weight k ≤ p + 1 are modular, so are those mod q of weight k for every prime q ≥ k − 1; (ii) the level-one conjecture mod one p > 2 gives it mod every q for weights ≤ p + 1.

**Input conditions.**

- k even (forced by oddness); for the corollary, q > 3 after the known small cases.
- Skinner–Wiles 2001 (OrdinaryAutomorphicFormsAndModularityLifting R21.5/nearly-ordinary-irreducible-lifting-over-q) covers a residually irreducible ρ̄ that is reducible over ℚ(√((−1)^{(p−1)/2}p)), i.e. induced from that field; for p ≡ 3 mod 4 the field is imaginary, the case that node excludes pending OrdinaryAutomorphicFormsAndModularityLifting/E11 (Lemma 2.2's dihedral bound fails for CM fields split above p; here p ramifies in ℚ(√−p)). KW I cite Skinner's correction for this case, unpublished (a gap)

**Construction/proof.**

1. If ρ̄ is irreducible and reducible over ℚ(√((−1)^{(p−1)/2}p)), Wintenberger's lemma makes ρ̄|_{I_p} ordinary and distinguished; otherwise Wiles, Taylor–Wiles, Diamond, Skinner–Wiles apply, except weight p + 1 non-ordinary, which Berger–Li–Zhu Cor. 4.1.3 excludes (it forces ρ̄|_{D_p} irreducible of weight 2, impossible at level one).
2. For Corollary 5.5 first remove residual dihedral/bad-dihedral cases using the R17 theta-series modularity and R20 exact weight/level result. In the remaining case the residual restriction to G_{ℚ(μ_q)} is absolutely irreducible. Import the crystalline weight-k minimal lift from R24.3/kw-annals-minimal-lifts (published Annals Theorem 3.3), and its general-weight compatible system from R24.5/kw-theorem-5-1-systems type (1) / published Annals Theorem 4.2(i). The weight-two system of Khare Proposition 3.1 alone does not supply this lift. Check the residual weight at p through R24.6/residual-members and R15.4, apply Lemma 5.4, and transfer through the system. Keep the bounds k≤p+1 and q≥k−1; part (ii) assumes the full theorem at p.

**Imports.**

- `SmallRamificationAndAbelianVarietyBaseCases:R25.5/level-one-dihedral-classification`
- `SmallRamificationAndAbelianVarietyBaseCases:R25.5/weight-two-level-one-excluded`
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.6`
- `ClassicalSerreModularity:R26.2/lifting-method-flatness`
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/nearly-ordinary-irreducible-lifting-over-q`
- `GL2ModularityLifting:R22.6`
- `LocalGaloisDeformationRings:R08.3`
- `PotentialModularityAndCompatibleSystems:R24.3/kw-annals-minimal-lifts`
- `PotentialModularityAndCompatibleSystems:R24.5/kw-theorem-5-1-systems`
- `PotentialModularityAndCompatibleSystems:R24.6/residual-members`
- `PotentialModularityAndCompatibleSystems:R24.6/linked-systems-modularity-transfer`
- `GL2AutomorphicRepresentationsAndTransfer:R17.5`
- `SerreWeightAndLevelOptimisation:R20.5`
- `AlgebraicModularFormsAndSerreWeights:R15.4`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`

**Acceptance.**

- The weight p + 1 non-ordinary case is excluded, not proved.

**Source locators.**

- khare-level-one: p. 22 of the preprint. Lemma 5.4.
- khare-level-one: p. 22 of the preprint. Corollary 5.5.
- breuil-mezard: §4.1, Proposition 4.1.1 and proof, author-copy pp.30–31. For crystalline HT {0,k−1} in this safe range, any stable-lattice reduction of a locally irreducible V is irreducible of niveau two. Thus reducible reduction forces the ordinary characteristic-zero branch. At the foil take k=2<p, including p=3. This scalar crystalline input is distinct from the nonscalar type of Proposition 6.1.1.

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/LevelOne`, namespace `TauCeti.SerreConjecture`

#### The degenerate branches of the level-one step

**Theorem.** `ClassicalSerreModularity:R26.4/degenerate-branches`. In the inductive step at P (Khare §6.2), let ρ be the irreducible minimal weight-two lift, ρ̄_ℓ its residual mod-ℓ member, and ρ″ the P-adic member of the second system. (a) If ρ̄_ℓ is solvable, distinguish three cases: reducible; irreducible but reducible on G_{ℚ(μ_ℓ)}; and absolutely irreducible on that restriction. In the first case its Barsotti–Tate lift is ordinary and distinguished, so residually reducible ordinary lifting applies. In the second, the GENERAL bad-dihedral local weight lemma excludes local irreducibility at weight 2 (it would force weight (ℓ+3)/2), giving the distinguished ordinary branch, with the stated CM correction gap. In the third, R17 gives residual modularity and the appropriate R22 potentially Barsotti–Tate theorem applies; do not infer ordinarity merely from solvable image. (b) If ρ̄_ℓ is unramified at P it has weight 2 and level one, hence is reducible, and the ordinary lifting branch applies. (c) For the return member, local residual reducibility at P makes ρ″ ordinary up to a Teichmüller twist by the nonscalar local classification, distinguished by even j. Globally irreducible bad-dihedral return residuals have level one and are ordinary by the level-one dihedral classification; cyclotomically absolutely irreducible solvable residuals use R17 and R22 instead. Residual reducibility after a change of prime is a branch, never ruled out by characteristic-zero irreducibility.

**Input conditions.**

- ℓ odd; the characteristic-zero representations are irreducible (they come from compatible systems of irreducible members).
- Skinner–Wiles 2001 (OrdinaryAutomorphicFormsAndModularityLifting R21.5/nearly-ordinary-irreducible-lifting-over-q) covers a residually irreducible ρ̄ that is reducible over ℚ(√((−1)^{(p−1)/2}p)), i.e. induced from that field; for p ≡ 3 mod 4 the field is imaginary, the case that node excludes pending OrdinaryAutomorphicFormsAndModularityLifting/E11 (Lemma 2.2's dihedral bound fails for CM fields split above p; here p ramifies in ℚ(√−p)). KW I cite Skinner's correction for this case, unpublished (a gap)

**Construction/proof.**

1. Split residual reducibility and cyclotomic restriction before selecting a lifting theorem. At the foil ℓ the residual representation may be ramified at both ℓ and P, so import Khare Lemma 5.1(ii)/KW Lemma 6.2(ii)/DP Lemma 1.14 in their general normalized-weight form from R15.4; the level-one classification cannot be applied there.
2. For the scalar crystalline weight-two lift at the foil ℓ, use Breuil–Mézard Proposition 4.1.1 with k=2<ℓ, an arbitrary stable lattice and the safe Fontaine–Laffaille interval [0,1]⊆[0,ℓ−2]. Its irreducible characteristic-zero branch has irreducible residual reduction; otherwise its ordinary characters reduce to χ̄_ℓ and 1, which are distinct for ℓ odd. Do not use the nonscalar Proposition 6.1.1 for a scalar type.
3. For the ordinary branches verify irreducibility of the characteristic-zero lift, ordinary local shape and distinct residual inertia characters before applying R21.5/theorem-a-over-q or the residually irreducible ordinary export. Retain the explicit unpublished CM correction gap.
4. For cyclotomically absolutely irreducible residuals obtain solvable residual modularity from R17 and use the R22 potentially BT/crystalline export with its precise local conditions. Transfer modularity through the linked systems.

**Imports.**

- `ClassicalSerreModularity:R26.4/local-reducibility-ordinary`
- `ClassicalSerreModularity:R26.4/level-one-lifting-lemma`
- `SmallRamificationAndAbelianVarietyBaseCases:R25.5/level-one-dihedral-classification`
- `SmallRamificationAndAbelianVarietyBaseCases:R25.5/weight-two-level-one-excluded`
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a`
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/nearly-ordinary-irreducible-lifting-over-q`
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-over-q`
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.6`
- `ClassicalSerreModularity:R26.4/ordinary-reduction-and-parity`
- `GL2AutomorphicRepresentationsAndTransfer:R17.6`
- `GL2ModularityLifting:R22.6`
- `AlgebraicModularFormsAndSerreWeights:R15.4`
- `PotentialModularityAndCompatibleSystems:R24.6/linked-systems-modularity-transfer`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`

**Acceptance.**

- Skinner–Wiles needs irreducibility of the characteristic-zero representation and ordinarity: both are checked here.

**Source locators.**

- khare-level-one: §6.2, pp. 26–27 of the preprint. Branch (a)(b).
- khare-level-one: §6.2, p. 27 of the preprint. Branch (c).
- breuil-mezard: §4.1, Proposition 4.1.1 and proof, author-copy pp.30–31. For crystalline HT {0,k−1} in this safe range, any stable-lattice reduction of a locally irreducible V is irreducible of niveau two. Thus reducible reduction forces the ordinary characteristic-zero branch. At the foil take k=2<p, including p=3. This scalar crystalline input is distinct from the nonscalar type of Proposition 6.1.1.

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/LevelOne`, namespace `TauCeti.SerreConjecture`

#### Ordinary reduction and residual distinction

**Lemma.** `ClassicalSerreModularity:R26.4/ordinary-reduction-and-parity`. At level one k is even. In the Khare step with previous bound p0+1 and new characteristic P, p0+2≤k≤P+1, a locally irreducible representation with k<P has a cyclotomic twist of weight P+3−k; a split local representation has a twist of weight P+1−k. The auxiliary-prime inequality places these weights in the already proved range. The remaining representation is ordinary (including k=P+1). The ordinary weight-2 lift has inertial characters whose residual ratio is nontrivial because k−1 is odd and P−1 is even. At a return member with even tame exponent j, the same parity checks the ordinary distinguished hypothesis after its Teichmüller twist.

**Input conditions.**

- Level one, odd characteristic P and even normalized weight k. Twist formulas require k≠2 and k<P; treat k=P+1 separately. In the return type j is even and 1≤j≤P−2, hence the ordinary residual character ratio has odd exponent and is nontrivial modulo the even integer P−1.

**Construction/proof.**

1. Apply the two twist formulas only when k≠2 and k<P, treating k=P+1 by its ordinary classification.
2. Use the previous bound to conclude the modularity of the twisted exceptional cases, and restore the twist.
3. Compute inertia-character ratios; the parity assertion is a non-scalar check, not a general automatic lifting theorem.

**Imports.**

- `ClassicalSerreModularity:R26.3/serre-weight-twist`
- `ClassicalSerreModularity:R26.3/chebyshev-next-prime`
- `AlgebraicModularFormsAndSerreWeights:R15.4`

**Acceptance.**

- Even weight does not authorize a p=2 distinguished-character conclusion.
- Keep the finite-order Teichmüller twist separate from the residual cyclotomic twist.

**Source locators.**

- khare-level-one: §6.2, pp.26–27. Ordinary reduction and residual distinction

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/LevelOne`, namespace `TauCeti.SerreConjecture`

### R26.5. Terminal weights and complete branch contracts

#### The small-weight table of the level-one proof

**Application.** `ClassicalSerreModularity:R26.5/small-weights-table`. (Khare §6.1.) Weights 2, 4, 6 are the older KW Annals Theorem 4.1 (published Theorems 5.2/5.4) (Fontaine, Schoof, Brumer–Kramer); p = 2, 3 are Tate and Serre. The remaining weights up to 32 are proved in the characteristic P with foil prime ℓ (ℓ^r ∥ P − 1) and nebentypus ω_P^j, giving new weights j + 2 or P + 1 − j already known: weight 8: P = 7, ℓ = 3, j = 2 → 4 or 6; weights 10, 12: P = 11, ℓ = 5, j = 4 → 6 or 8; weights 14–20: P = 19, ℓ = 3, j = 8 → 10 or 12; weights 22–30: P = 29, ℓ = 7, j = 16 (weights 22, 26, 30) → 18 or 14, j = 14 (weights 24, 28) → 16; weight 32: P = 31, ℓ = 5, j = 18 → 20 or 14 (Khare prints j = 16, which is not in the admissible coset: E2).

**Input conditions.**

- In each row j lies in the coset allowed by nebentype-lift-at-q: j ≡ (prime-to-ℓ part of k − 2) mod (P − 1)/ℓ^r, e.g. at P = 29, ℓ = 7: k − 2 = 22, 26 give ω^{14}, and k − 2 = 20, 24, 28 give the trivial character.

**Construction/proof.**

1. Use R25 for p=2,3 and weights 2,4,6.
2. Apply the five terminal row nodes in increasing order; every row includes the branch contract and characteristic-transfer corollary.
3. This proves the even weights ≤32 for every characteristic. Odd weights at level one are excluded by determinant parity.

**Imports.**

- `ClassicalSerreModularity:R26.5/weight-eight`
- `ClassicalSerreModularity:R26.5/weights-ten-twelve`
- `ClassicalSerreModularity:R26.5/weights-fourteen-twenty`
- `ClassicalSerreModularity:R26.5/weights-twentytwo-thirty`
- `ClassicalSerreModularity:R26.5/weight-thirtytwo`
- `SmallRamificationAndAbelianVarietyBaseCases:R25.6/base-case-table-holds`

**Acceptance.**

- The 22–30 row prints 'unramified outside 3, 19' for the mod-7 lift; it should be 7, 29 (E1).
- The weight-32 row prints nebentypus ω_31^{16}; with foil 5, η_31 = ω_31^6 and the lift is semistable at 31, so j must be a multiple of 6; j = 18 (weights 20 or 14) works (E2).

**Uses.**

- `ClassicalSerreModularity:R26.3/level-one-induction-scheme`: S(32).

**Source locators.**

- khare-level-one: §6.1, p. 23 of the preprint. §6.1.
- khare-level-one: §6.1, p. 25 of the preprint. The 22–30 row.

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/LevelOne`, namespace `TauCeti.SerreConjecture`

#### Terminal-row lifting and degeneracy contract

**Application.** `ClassicalSerreModularity:R26.5/terminal-row-branch-contract`. In each terminal row (P,ℓ,j), start with an odd absolutely irreducible level-one mod-P representation of the listed even weight. After the local twist reduction it is ordinary; construct its minimal weight-2 lift/system. The mod-ℓ member is weight 2 and ramified only at ℓ,P. If solvable, separate reducible, bad-dihedral ordinary, and cyclotomically absolutely irreducible solvable branches, then apply the matching R21 or R22 lifting theorem; if unramified at P, the level-one weight-2 exclusion makes it reducible. Otherwise change its P-nebentype to ω_P^j, keeping j≡k−2 modulo (P−1)/ℓ^e, form the second system and return to P. Reducible/solvable return members use local ordinarity and the explicit lifting contracts; non-solvable members have weight j+2 or a cyclotomic twist of weight P+1−j, both in an earlier row. Restore that twist, lift modularity, transfer at ℓ, then transfer to the initial residual representation and optimise its weight and level.

**Input conditions.**

- P and ℓ are distinct odd primes, ℓ^e exactly divides P−1 and the listed weight is even. Choose even j with 1≤j≤P−2 and j≡k−2 mod (P−1)/ℓ^e; keep the ramification set {ℓ,P}. New residual members need not be irreducible.

**Construction/proof.**

1. Verify the full determinant and local type at each transition rather than equating weights by numerical arithmetic alone.
2. At the foil ℓ (including ℓ=3), exclude locally irreducible bad-dihedral weight 2 by the general R15.4 normalized-weight lemma, not the level-one classification: ramification at P may remain. Follow the three solvable branches of degenerate-branches. The residually irreducible ordinary CM case retains its correction gap.
3. At P, local reducibility gives ordinary up to a Teichmüller twist via R07.5; the potentially BT nonordinary lift uses R22.6 with cyclotomic irreducibility.
4. Check the unipotent/semistable endpoint k=P+1 separately: its admissible exponent coset is 0.

**Imports.**

- `ClassicalSerreModularity:R26.2/minimal-weight-two-lift`
- `ClassicalSerreModularity:R26.2/nebentype-lift-at-q`
- `ClassicalSerreModularity:R26.2/compatible-system-lifts`
- `ClassicalSerreModularity:R26.4/degenerate-branches`
- `ClassicalSerreModularity:R26.4/ordinary-reduction-and-parity`
- `PotentialModularityAndCompatibleSystems:R24.6/linked-systems-modularity-transfer`
- `SerreWeightAndLevelOptimisation:R20.6`
- `AlgebraicModularFormsAndSerreWeights:R15.4`

**Acceptance.**

- Neither compatible-system construction guarantees that the new residual member is irreducible.
- The nonordinary lifting theorem needs the residual restriction hypothesis; a numerical weight bound alone is insufficient.

**Source locators.**

- khare-level-one: §6.1, pp.23–26. Terminal-row lifting and degeneracy contract

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/LevelOne`, namespace `TauCeti.SerreConjecture`

#### Weight eight

**Application.** `ClassicalSerreModularity:R26.5/weight-eight`. Every odd absolutely irreducible residual level-one representation of weight k∈[8] is modular. Work first in characteristic P=7; choose foil ℓ=3, ℓ^e=3 exactly dividing P−1, and j=2. The earlier weights after the return to P are [4, 6], up to the prescribed cyclotomic twist. Apply the complete solvable/unramified/ordinary/nonordinary branch contract, then Corollary 5.5 to transport the result to every residual characteristic; Tate–Serre covers p=2,3. No abelian-variety realisation is constructed in this row.

**Input conditions.**

- The initial representation has characteristic P=7, level one and the listed even weight; after reduction at ℓ=3 its ramification support is contained in {3,7}.
- Use j=2 in the admissible residue coset.

**Construction/proof.**

1. Local irreducible/split twists of the listed weights at P=7 either have an earlier weight or leave the ordinary case. Check k=P+1 separately.
2. Compute the nebentype residue coset before selecting j. Use the two systems and the full branch contract; invoke only earlier row weights.
3. Restore all twists and apply weight/level optimisation. Together with the earlier rows, this proves every normalized even weight≤8 in characteristic 7, hence the full level-one theorem in that characteristic. Only then invoke Corollary 5.5(ii) to export the bound 8 to every characteristic; part (i) alone exports fixed k only to q≥k−1.

**Imports.**

- `ClassicalSerreModularity:R26.5/terminal-row-branch-contract`
- `ClassicalSerreModularity:R26.4/level-one-lifting-lemma`
- `SmallRamificationAndAbelianVarietyBaseCases:R25.6/base-case-table-holds`
- `SmallRamificationAndAbelianVarietyBaseCases:R25.2/tate-serre-base-case`

**Acceptance.**

- Check exact divisor 3∥6 and the coset modulo 2.
- Both residual weights belong to [4, 6]; no recursion to the current row.

**Source locators.**

- khare-level-one: §6.1, pp.23–26. Weight eight

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/LevelOne`, namespace `TauCeti.SerreConjecture`

#### Weights ten and twelve

**Application.** `ClassicalSerreModularity:R26.5/weights-ten-twelve`. Every odd absolutely irreducible residual level-one representation of weight k∈[10, 12] is modular. Work first in characteristic P=11; choose foil ℓ=5, ℓ^e=5 exactly dividing P−1, and j=4. The earlier weights after the return to P are [6, 8], up to the prescribed cyclotomic twist. Apply the complete solvable/unramified/ordinary/nonordinary branch contract, then Corollary 5.5 to transport the result to every residual characteristic; Tate–Serre covers p=2,3. No abelian-variety realisation is constructed in this row.

**Input conditions.**

- The initial representation has characteristic P=11, level one and the listed even weight; after reduction at ℓ=5 its ramification support is contained in {5,11}.
- Use j=4 in the admissible residue coset.

**Construction/proof.**

1. Local irreducible/split twists of the listed weights at P=11 either have an earlier weight or leave the ordinary case. Check k=P+1 separately.
2. Compute the nebentype residue coset before selecting j. Use the two systems and the full branch contract; invoke only earlier row weights.
3. Restore all twists and apply weight/level optimisation. Together with the earlier rows, this proves every normalized even weight≤12 in characteristic 11, hence the full level-one theorem in that characteristic. Only then invoke Corollary 5.5(ii) to export the bound 12 to every characteristic; part (i) alone exports fixed k only to q≥k−1.

**Imports.**

- `ClassicalSerreModularity:R26.5/terminal-row-branch-contract`
- `ClassicalSerreModularity:R26.4/level-one-lifting-lemma`
- `SmallRamificationAndAbelianVarietyBaseCases:R25.6/base-case-table-holds`
- `SmallRamificationAndAbelianVarietyBaseCases:R25.2/tate-serre-base-case`
- `ClassicalSerreModularity:R26.5/weight-eight`

**Acceptance.**

- Check exact divisor 5∥10 and the coset modulo 2.
- Both residual weights belong to [6, 8]; no recursion to the current row.

**Source locators.**

- khare-level-one: §6.1, pp.23–26. Weights ten and twelve

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/LevelOne`, namespace `TauCeti.SerreConjecture`

#### Weights fourteen through twenty

**Application.** `ClassicalSerreModularity:R26.5/weights-fourteen-twenty`. Every odd absolutely irreducible residual level-one representation of weight k∈[14, 16, 18, 20] is modular. Work first in characteristic P=19; choose foil ℓ=3, ℓ^e=9 exactly dividing P−1, and j=8. The earlier weights after the return to P are [10, 12], up to the prescribed cyclotomic twist. Apply the complete solvable/unramified/ordinary/nonordinary branch contract, then Corollary 5.5 to transport the result to every residual characteristic; Tate–Serre covers p=2,3. No abelian-variety realisation is constructed in this row.

**Input conditions.**

- The initial representation has characteristic P=19, level one and the listed even weight; after reduction at ℓ=3 its ramification support is contained in {3,19}.
- Use j=8 in the admissible residue coset.

**Construction/proof.**

1. Local irreducible/split twists of the listed weights at P=19 either have an earlier weight or leave the ordinary case. Check k=P+1 separately.
2. Compute the nebentype residue coset before selecting j. Use the two systems and the full branch contract; invoke only earlier row weights.
3. Restore all twists and apply weight/level optimisation. Together with the earlier rows, this proves every normalized even weight≤20 in characteristic 19, hence the full level-one theorem in that characteristic. Only then invoke Corollary 5.5(ii) to export the bound 20 to every characteristic; part (i) alone exports fixed k only to q≥k−1.

**Imports.**

- `ClassicalSerreModularity:R26.5/terminal-row-branch-contract`
- `ClassicalSerreModularity:R26.4/level-one-lifting-lemma`
- `SmallRamificationAndAbelianVarietyBaseCases:R25.6/base-case-table-holds`
- `SmallRamificationAndAbelianVarietyBaseCases:R25.2/tate-serre-base-case`
- `ClassicalSerreModularity:R26.5/weights-ten-twelve`

**Acceptance.**

- Check exact divisor 9∥18 and the coset modulo 2.
- Both residual weights belong to [10, 12]; no recursion to the current row.

**Source locators.**

- khare-level-one: §6.1, pp.23–26. Weights fourteen through twenty

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/LevelOne`, namespace `TauCeti.SerreConjecture`

#### Weights twenty-two through thirty

**Application.** `ClassicalSerreModularity:R26.5/weights-twentytwo-thirty`. Every odd absolutely irreducible residual level-one representation of weight k∈[22, 24, 26, 28, 30] is modular. Work first in characteristic P=29; choose foil ℓ=7, ℓ^e=7 exactly dividing P−1, and j=16 for k=22,26,30 and j=14 for k=24,28. The earlier weights after the return to P are [14, 16, 18], up to the prescribed cyclotomic twist. Apply the complete solvable/unramified/ordinary/nonordinary branch contract, then Corollary 5.5 to transport the result to every residual characteristic; Tate–Serre covers p=2,3. No abelian-variety realisation is constructed in this row.

**Input conditions.**

- The initial representation has characteristic P=29, level one and the listed even weight; after reduction at ℓ=7 its ramification support is contained in {7,29}.
- Use j=16 for k=22,26,30 and j=14 for k=24,28, modulo (29−1)/7=4. E1 changes only the ramification list to {7,29}; E2 does not apply to this row.

**Construction/proof.**

1. Local irreducible/split twists of the listed weights at P=29 either have an earlier weight or leave the ordinary case. Check k=P+1 separately.
2. Compute the nebentype residue coset before selecting j. Use the two systems and the full branch contract; invoke only earlier row weights.
3. Restore all twists and apply weight/level optimisation. Together with the earlier rows, this proves every normalized even weight≤30 in characteristic 29, hence the full level-one theorem in that characteristic. Only then invoke Corollary 5.5(ii) to export the bound 30 to every characteristic; part (i) alone exports fixed k only to q≥k−1.

**Imports.**

- `ClassicalSerreModularity:R26.5/terminal-row-branch-contract`
- `ClassicalSerreModularity:R26.4/level-one-lifting-lemma`
- `SmallRamificationAndAbelianVarietyBaseCases:R25.6/base-case-table-holds`
- `SmallRamificationAndAbelianVarietyBaseCases:R25.2/tate-serre-base-case`
- `ClassicalSerreModularity:R26.5/weights-fourteen-twenty`

**Acceptance.**

- Check exact divisor 7∥28 and the coset modulo 4.
- Both residual weights belong to [14, 16, 18]; no recursion to the current row.

**Source locators.**

- khare-level-one: §6.1, pp.23–26. Weights twenty-two through thirty

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/LevelOne`, namespace `TauCeti.SerreConjecture`

#### Weight thirty-two

**Application.** `ClassicalSerreModularity:R26.5/weight-thirtytwo`. Every odd absolutely irreducible residual level-one representation of weight k∈[32] is modular. Work first in characteristic P=31; choose foil ℓ=5, ℓ^e=5 exactly dividing P−1, and j=18. The earlier weights after the return to P are [14, 20], up to the prescribed cyclotomic twist. Apply the complete solvable/unramified/ordinary/nonordinary branch contract, then Corollary 5.5 to transport the result to every residual characteristic; Tate–Serre covers p=2,3. No abelian-variety realisation is constructed in this row.

**Input conditions.**

- The initial representation has characteristic P=31, level one and the listed even weight; after reduction at ℓ=5 its ramification support is contained in {5,31}.
- Use j=18, which lies in (12,18] and is divisible by 6; the source’s j=16 is inadmissible (E2).

**Construction/proof.**

1. Local irreducible/split twists of the listed weights at P=31 either have an earlier weight or leave the ordinary case. Check k=P+1 separately.
2. Compute the nebentype residue coset before selecting j. Use the two systems and the full branch contract; invoke only earlier row weights.
3. Restore all twists and apply weight/level optimisation. Together with the earlier rows, this proves every normalized even weight≤32 in characteristic 31, hence the full level-one theorem in that characteristic. Only then invoke Corollary 5.5(ii) to export the bound 32 to every characteristic; part (i) alone exports fixed k only to q≥k−1.

**Imports.**

- `ClassicalSerreModularity:R26.5/terminal-row-branch-contract`
- `ClassicalSerreModularity:R26.4/level-one-lifting-lemma`
- `SmallRamificationAndAbelianVarietyBaseCases:R25.6/base-case-table-holds`
- `SmallRamificationAndAbelianVarietyBaseCases:R25.2/tate-serre-base-case`
- `ClassicalSerreModularity:R26.5/weights-twentytwo-thirty`

**Acceptance.**

- Check exact divisor 5∥30 and the coset modulo 6.
- Both residual weights belong to [14, 20]; no recursion to the current row.

**Source locators.**

- khare-level-one: §6.1, pp.23–26. Weight thirty-two

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/LevelOne`, namespace `TauCeti.SerreConjecture`

### R26.6. Level-one assembly and W₁

#### Proof of the level-one theorem

**Theorem.** `ClassicalSerreModularity:R26.6/level-one-proof-assembly`. (Khare §6.2, end.) In the inductive step, the second compatible system (ρ′_λ) is modular (its P-adic member ρ″ has residual weight ≤ p_n + 1, or falls in a degenerate branch), and it is linked to (ρ_λ) at the place above ℓ (isomorphic non-solvable residual representations); Wiles–Taylor–Wiles make (ρ_λ) modular, so ρ̄ is modular of some weight and level, hence of weight k(ρ̄) and level N(ρ̄) = 1 by Ribet and Edixhoven. With S(32) this proves S(B) for all B.

**Input conditions.**

- The two systems have no added fixed Weil–Deligne ramification at the foil ℓ: the relevant ℓ-adic lifts are crystalline weight two. A member may still be ramified at its own coefficient prime. Apply linked-system transfer only after verifying the residual and local lifting hypotheses.

**Construction/proof.**

1. Chain the two systems through the linking prime ℓ; apply the weight and level optimisation (Ribet; Edixhoven) to pass from 'some weight and level' to (k(ρ̄), 1).

**Imports.**

- `ClassicalSerreModularity:R26.3/level-one-induction-scheme`
- `ClassicalSerreModularity:R26.4/degenerate-branches`
- `ClassicalSerreModularity:R26.5/small-weights-table`
- `SerreWeightAndLevelOptimisation:R20.6`
- `AlgebraicModularFormsAndSerreWeights:R15.6`
- `PotentialModularityAndCompatibleSystems:R24.6/linked-systems-modularity-transfer`
- `GL2ModularityLifting:R22.6`

**Acceptance.**

- Two lifting theorems of the residually irreducible type are used at the linking step; the residually degenerate ones only in degenerate-branches.

**Source locators.**

- khare-level-one: §6.2, p. 28 of the preprint. The conclusion.

**Atlas planet.** Assembly of the level-one proof

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/LevelOne`, namespace `TauCeti.SerreConjecture`

#### Proof of Corollary 1.2 (conductor a prime, weight 2)

**Theorem.** `ClassicalSerreModularity:R26.6/corollary-1-2-proof`. (Khare §7.1, corrected by KW I §8.3.) Corollary 1.2 holds (for all p, KW I Corollary 8.1(i)): for q = 2 by the semistable weight-two input of KW Annals (old Theorem4.1(ii), published Theorem5.2(ii)), after the conductor-two semistability check from R01.5 and the R25 abelian-variety application; for q odd by killing ramification: a minimal p-adic lift in a compatible system, whose member above q reduces to a mod-q representation unramified outside q, modular by the level-one theorem; then the lifting theorems (Lemmas 5.1, 5.3) make the system modular. KW I replace the reference 'Theorem 5.1(3) of [24]' (insufficient when p ∤ q − 1) by Theorem 6.1(2) of [24] with Skinner–Wiles [39]–[41], via Saito (semistable case) or Theorem 5.1(3 ii) (unramified over ℚ_q(μ_q)).

**Input conditions.**

- The copy of [24] read here is the arXiv v1 preprint, whose numbering (Proposition 3.1) differs from the published Duke numbering (Theorems 5.1, 6.1) used by KW I.
- KW I's [41] is C. Skinner, 'Nearly ordinary deformations of residually dihedral representations' ('to appear'; listed as a 2009 preprint by Allen, arXiv:1301.1113), which KW I call a correction to Skinner–Wiles 2001 ([40]); it is unpublished and was not read (a gap), and it concerns the dihedral case of OrdinaryAutomorphicFormsAndModularityLifting/E11

**Construction/proof.**

1. For q=2, prime-to-p conductor forces p odd. Conductor exponent one means inertia has one-dimensional invariants and Swan conductor zero. On the quotient the tame inertia character is Frobenius-stable, so χ=χ² and χ=1; the inertia image is unipotent of p-power order. Together with k=2 this is precisely published Annals Definition4.1 semistability. Request this local inference from R01.5.
2. Apply published Annals Theorem5.2(ii). Its proof first handles reducible cyclotomic restriction by known dihedral modularity and weight/level optimisation; otherwise Theorem4.2(ii) realises a weight-two minimal compatible system in a positive-dimensional GL2-type abelian variety with good reduction outside 2 and semistable reduction at 2. Import the compatible-system/realisation contracts and R25.4/schoof-theorem; the abelian variety must be zero, a contradiction. R25 does not itself export an arbitrary conductor-two residual theorem.
3. For q odd use the required minimal weight-two system and split the q-adic local parameter into semistable with nonzero monodromy or unramified over Q_q(μ_q). Its residual representation is unramified outside q, so the level-one theorem or its reducible convention gives residual modularity.
4. Identify and apply the published Duke Theorem6.1(2) with the corrected Skinner–Wiles references; this is an explicit source boundary, not inferred from Proposition3.1 of the preprint. Transfer modularity through the system and optimise to weight2, level Γ₁(q).
5. Killing ramification is published Annals §6.2 (older cited §5.2); it is a method with lifting hypotheses, not an unconditional licence to remove local ramification.

**Imports.**

- `ClassicalSerreModularity:R26.6/level-one-proof-assembly`
- `ClassicalSerreModularity:R26.4/level-one-lifting-lemma`
- `ClassicalSerreModularity:R26.4/local-reducibility-ordinary`
- `PotentialModularityAndCompatibleSystems:R24.6/linked-systems-modularity-transfer`
- `PotentialModularityAndCompatibleSystems:R24.5/kw-theorem-5-1-systems`
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a`
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/nearly-ordinary-irreducible-lifting-over-q`
- `ArithmeticGaloisRepresentations:R01.5`
- `SmallRamificationAndAbelianVarietyBaseCases:R25.4/schoof-theorem`
- `SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety`
- `SmallRamificationAndAbelianVarietyBaseCases:R25.5/descent-of-gl2-type-realisation`
- `SmallRamificationAndAbelianVarietyBaseCases:R25.5/reduction-of-the-realisation`
- `GL2AutomorphicRepresentationsAndTransfer:R17.5`
- `SerreWeightAndLevelOptimisation:R20.6`

**Acceptance.**

- Keep KW I's correction: the q-adic member may be ramified at q, and the split into the semistable and the unramified-over-ℚ_q(μ_q) cases is needed.
- Check q=2 semistability from Artin exponent one before invoking Annals Theorem5.2(ii); the residual prime-to-p conductor rules out p=q=2.

**Source locators.**

- khare-level-one: §7.1, p. 28 of the preprint. §7.1.
- kw-serre-modularity-I: §8.3, p. 16 of the preprint. KW I's corrected step.
- kw-serre-modularity-I: §8.3, proof of Corollary 8.1, p. 16 of the preprint. KW I's [41] = C. Skinner, Nearly ordinary deformations of residually dihedral representations ('to appear'), a correction to Skinner–Wiles 2001 ([40]).
- kw-annals: Published Definition4.1, Theorem4.2(ii), pp.243–244; Theorem5.2(ii), p.247; §6.2, pp.250–251 (older cited Theorem4.1(ii)/§5.2). The q=2 case first needs the conductor-one-at-2 ⇒ unipotent local inference. Annals Theorem5.2(ii) then excludes this semistable weight-two case; its abelian-variety proof imports Schoof through R25, not an arbitrary conductor-two theorem from R25.

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/LevelOne`, namespace `TauCeti.SerreConjecture`

#### Finiteness of level-one representations

**Theorem.** `ClassicalSerreModularity:R26.6/finiteness-corollary-1-3`. For each prime p there are finitely many isomorphism classes of continuous semisimple odd representations G_Q→GL₂(F̄_p) unramified outside p. In the absolutely irreducible case the level-one theorem, weight normalisation by one of finitely many cyclotomic twists and realisation in S₂(Γ₁(p²)) bound the residual systems of Hecke eigenvalues. The reducible semisimple case consists of sums of two characters unramified outside p: finite-order characters with values in F̄_pˣ factor through the prime-to-p quotient of Z_pˣ, hence have order dividing p−1 (trivial when p=2). Finiteness of a complex vector-space dimension alone is insufficient: use the finite integral Hecke algebra reduced modulo p.

**Construction/proof.**

1. Normalise irreducible weights by the finite cyclotomic-twist set; use the level-one theorem and its weight-2 realisation.
2. Use finite generation of the integral Hecke algebra and finiteness of its mod-p eigencharacters; residual attached representations are determined up to semisimplification by Frobenius.
3. Use Kronecker–Weber/abelian character classification for the reducible semisimple branch; unipotent extensions are excluded by semisimplicity.

**Imports.**

- `ClassicalSerreModularity:R26.6/level-one-proof-assembly`
- `AlgebraicModularFormsAndSerreWeights:R15.6`
- `ArithmeticGaloisRepresentations:R01.5`
- `AlgebraicModularFormsAndSerreWeights:R15.3`

**Acceptance.**

- Quantitative refinements are open (Khare §7.2).

**Source locators.**

- khare-level-one: §7.1, p. 28 of the preprint. The proof.

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/LevelOne`, namespace `TauCeti.SerreConjecture`

#### Corollary 8.1(ii) and the derivation of the induction's starting point (W_1)

**Theorem.** `ClassicalSerreModularity:R26.6/corollary-8-1-ii-and-the-statement-W1`. Corollary 8.1(ii): if rho-bar is an irreducible, odd, 2-dimensional mod p representation of G_Q with k(rho-bar) = 2, unramified outside p and one other odd prime q, tamely ramified at q, such that the order of rho-bar(I_q) is a power of an odd prime t > 5, then rho-bar arises from S_2(Gamma_1(q^2)). Theorem 3.3 - the hypothesis (W_r) for r = 1 - follows from this. Thus the starting point of the KW induction is NOT the conductor-one theorem restated: (W_1) concerns locally good-dihedral representations of weight 2 whose odd conductor has at most one prime divisor, and Corollary 8.1(ii) is the statement about representations ramified at exactly one odd prime q with tame image of odd prime-power order t > 5 - i.e. exactly the shape a good dihedral prime produces.

**Input conditions.**

- For the main reduction one may first dispose of t=p by Corollary 8.1(i); otherwise t is an odd prime >5 distinct from p. Tameness rules out t=q. The original corollary itself does not assume t≠p.
- one may assume the projective image of rho-bar is not dihedral, the A_4 and S_4 cases reducing to level one because t > 5
- the conclusion is stated at level q^2 (S_2(Gamma_1(q^2))); the source gives no further explanation of the exponent
- the argument uses modularity lifting results of Skinner-Wiles in the residually reducible branch and Wiles/Taylor-Wiles in the residually irreducible branch

**Construction/proof.**

1. Reduce (ii) to (i). Build an almost strictly compatible lift by Theorem 5.1(1): rho_p unramified outside {p, q}, crystalline of weight 2 at p, with |rho_p(I_q)| = |rho-bar_p(I_q)|.
2. Consider the mod t reduction rho-bar_t. If it is reducible, or unramified at q (which forces reducibility by the level-one weight-2 case), apply Skinner-Wiles to conclude rho_t is modular; note rho_t is crystalline of weight 2 because the system is almost strictly compatible of weight 2 and t is not 2.
3. If rho-bar_t is irreducible and ramified at q, then k(rho-bar_t) = 2 by almost strict compatibility and part (i) gives modularity (the ramification at q is unipotent); Wiles/Taylor-Wiles then gives modularity of rho_t.
4. In the last case, irreducibility of rho-bar_t restricted to Q(mu_t) is checked either from |rho-bar_t(I_q)| = t or from k(rho-bar_t) = 2 together with Lemma 6.2(ii).

**Imports.**

- `ClassicalSerreModularity:R26.6/corollary-1-2-proof`
- `ClassicalSerreModularity:R27.1/good-dihedral-prime-definition`
- `ClassicalSerreModularity:R27.2/hypotheses-Lr-Wr-and-Dr`
- `PotentialModularityAndCompatibleSystems:R24.5/kw-theorem-5-1-systems`
- `PotentialModularityAndCompatibleSystems:R24.4/kw-theorem-4-1`
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a`
- `AlgebraicModularFormsAndSerreWeights:R15.4`

**Acceptance.**

- Check that the produced form has level q^2 and not q, and that this is what (W_1) consumes
- Check that the branch where rho-bar_t becomes reducible after the change of prime is actually reachable, so that it is a branch of the proof and not an impossible case

**Source locators.**

- kw-serre-modularity-I: §8.3, p. 15 of the preprint. §8.3.

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/GoodDihedral`, namespace `TauCeti.SerreConjecture`

### R27.1. Good-dihedral definitions and image protection

#### Definition 2.1: good dihedral prime

**Definition.** `ClassicalSerreModularity:R27.1/good-dihedral-prime-definition`. Use Mathlib Nat.maxPrimeFac for KW’s Q: Q(1)=1 and Q(n) is the largest prime divisor for n≥2. N is the positive prime-to-p Artin conductor; q² divides N in the specified nontrivial tame niveau-two shape. For rho-bar: G_Q -> GL_2(F_p-bar) continuous, a prime q different from p is a good dihedral prime for rho-bar if (i) rho-bar restricted to I_q is of the form diag(psi, psi^q) with psi a NON-TRIVIAL character of I_q whose order is a power of an odd prime t such that t divides q+1 and t > max(Q(N(rho-bar)/q^2), 5, p); and (ii) q is 1 mod 8, and 1 mod r for every prime r with r <= max(Q(N(rho-bar)/q^2), p). If such a q exists, rho-bar is called locally good-dihedral (for the prime q), or q-dihedral.

**Input conditions.**

- psi must be nontrivial and of order a power of an ODD prime t with t | q+1 - so psi is of level 2 at q and t does not divide q-1
- the bound on t is taken against Q(N(rho-bar)/q^2), i.e. the largest prime dividing the prime-to-q part of the conductor, together with 5 and p
- condition (ii) (q = 1 mod 8 and q = 1 mod r for the primes r in range) is used in the proof of Lemma 6.3(i) to show that q splits or ramifies in any quadratic field K unramified outside the primes at which rho-bar ramifies, both of which are then excluded
- the definition is a property of the pair (rho-bar, q), and both conditions refer to N(rho-bar), so it is not stable under arbitrary changes of level

**Construction/proof.**

1. The definition is stated outright in the source. Its purpose, made explicit in Remark 2 after the proof of Theorem 3.2, is that starting with a q-dihedral rho-bar in characteristic P ramified at a set S, the proofs of Theorems 3.1 and 3.2 only need residual representations in characteristic at most max over l in S minus {q} of (P, l) - which is exactly the range in which (i) and (ii) have been imposed.

**Imports.**

- `ArithmeticGaloisRepresentations:R01.4`
- `ArithmeticGaloisRepresentations:R01.5`
- `AlgebraicModularFormsAndSerreWeights:R15.4`
- `mathlib:Nat.maxPrimeFac`
- `mathlib:Nat.maxPrimeFac_one`
- `mathlib:Nat.isGreatest_maxPrimeFac`
- `mathlib:Matrix.GeneralLinearGroup`

**Acceptance.**

- Check on an explicit example that t > 5, t | q+1 and t odd force rho-bar restricted to D_q to be irreducible
- Check that condition (ii) fails for some q = 5 mod 8 and that the Lemma 6.3 argument then breaks at the ramified-quadratic-field step

**Uses.**

- `ClassicalSerreModularity:R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved`: Lemma 6.3.
- `ClassicalSerreModularity:R27.2/hypotheses-Lr-Wr-and-Dr`: the restriction to locally good-dihedral ρ̄.
- `ClassicalSerreModularity:R33.2, R33.3, R33.6`: The modern strand consumes only this definition, image protection and the early Chebotarev prefix, independent of R26 modularity.

**Required API.**

- `TauCeti.SerreConjecture.IsGoodDihedralPrime` (constructor): For supplied continuous residual ρ, p, its actual positive conductor N, inertia subgroups I_q and q, return the conjunction of prime/noncharacteristic conditions, a basis conjugating ρ|I_q to diag(ψ,ψ^q), nontrivial exact order t^a (a>0), odd prime t|q+1 with the strict size bound, and the two congruence conditions.
- `TauCeti.SerreConjecture.IsLocallyGoodDihedral` (characterisation): IsLocallyGoodDihedral ρ iff there exists q with IsGoodDihedralPrime ρ q.
- `TauCeti.SerreConjecture.IsGoodDihedralPrime.inertia` (projection): Extract t,a,ψ and the change of basis, with a>0, exact order t^a and all the size/divisibility conditions. The character is not trivial.
- `TauCeti.SerreConjecture.IsGoodDihedralPrime.congruences` (projection): q≡1 mod8 and q≡1 mod s for every prime s≤max(Q(N/q²),p). Include equality at the upper endpoint.
- `TauCeti.SerreConjecture.IsGoodDihedralPrime.conjugate` (compatibility): Replacing ρ by B⁻¹ρB for an invertible B leaves the predicate unchanged (with the same p,N and transported inertia).
- `TauCeti.SerreConjecture.IsGoodDihedralPrime.q_sq_dvd_conductor` (relation): For the actual residual Galois representation, its nontrivial tame niveau-two inertia has no invariants, so the local Artin conductor exponent is 2 and q² divides N.
- `TauCeti.SerreConjecture.IsGoodDihedralPrime.locallyGood` (constructor): A proof that q is good-dihedral gives IsLocallyGoodDihedral with q as witness.
- `TauCeti.SerreConjecture.IsLocallyGoodDihedral.exists_good` (projection): A locally good-dihedral representation has a prime witness q and the full IsGoodDihedralPrime proof, without unfolding the predicate.
- `TauCeti.SerreConjecture.IsLocallyGoodDihedral.conjugate` (compatibility): Conjugating the representation by B∈GL₂ preserves existence of a good-dihedral prime, with the same p,N and supplied inertia.

**Discriminating tests.**

- `goodDihedral_congruence_fails` (non-example): For any representation, characteristic p and conductor N, q=13 cannot be good-dihedral because 13≢1 mod8.
- `goodDihedral_trivial_inertia_fails` (degenerate): For any field of characteristic p and q≠p with positive actual conductor N, a representation trivial on I_q is not good-dihedral: exact character order t^a with a>0,t>5 rules out ψ=1.
- `goodDihedral_upper_endpoint` (characterisation): For p=7, q=241 and N=9·241², Q(N/q²)=3. The congruences at 2,3,5 and modulo8 hold, but 241≢1 mod7. Thus the predicate fails: equality at the upper endpoint s=p is required.
- `goodDihedral_basis_change` (compatibility): For any B∈GL₂(F), the predicates at ρ and g↦B⁻¹ρ(g)B are equivalent; the witness basis is composed with B.
- `locallyGood_single_witness` (characterisation): Given one good prime q, the representation is locally good-dihedral although 13 is never a good candidate. This detects replacing the existential wrapper by a universal quantifier.
- `locallyGood_trivial_inertia_fails` (non-example): If the representation is trivial on every supplied I_q, it is not locally good-dihedral, whatever the conductor parameter; an unconstrained existential prime is insufficient.
- `locallyGood_basis_change` (compatibility): Global existence of a good-dihedral prime is equivalent before and after any basis change B∈GL₂; the prime witness and local character order must survive.

**Source locators.**

- kw-serre-modularity-I: Definition 2.1, p. 5 of the preprint. Condition (i).
- kw-serre-modularity-I: Definition 2.1, p. 5 of the preprint. Condition (ii).
- kw-serre-modularity-I: §8.2, Remark 2, p. 15 of the preprint. Remark 2: the motivation.

**Atlas planet.** Good dihedral primes

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/GoodDihedral`, namespace `TauCeti.SerreConjecture`

#### Lemma 6.3: a locally good-dihedral representation has non-solvable, non-A_5 image, and the property propagates through a compatible system

**Lemma.** `ClassicalSerreModularity:R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved`. Let rho-bar be locally good-dihedral for a prime q. (i) The image of rho-bar is not solvable and its projective image is not isomorphic to A_5. (ii) Let (rho_iota) be any compatible system lifting rho-bar whose fixed Weil–Deligne ramification support is contained in the prime divisors of N(rho-bar)p, allowing each member also to ramify at its own coefficient prime, and such that rho_p restricted to D_q is a minimal lift of rho-bar restricted to D_q. Then for any prime r <= max(Q(N(rho-bar)/q^2), p), any mod r representation rho-bar_r arising from (rho_iota) is again locally good-dihedral for the prime q, and hence has non-solvable image with projective image not A_5.

**Input conditions.**

- In (ii) fixed Weil–Deligne ramification support is contained in the primes dividing N(rho-bar)p, and rho_p is minimal at q. A member of coefficient characteristic r may additionally ramify at r; it is not asserted that every member has actual ramification contained in N(rho-bar)p.
- the range of r is bounded by max(Q(N(rho-bar)/q^2), p), exactly the bound built into Definition 2.1
- the argument for (i) uses t > 5 twice: to exclude A_5, and to force the projective image to be dihedral in the solvable case via Dickson

**Construction/proof.**

1. Use only Dickson’s generic image classification from R01.4, not the mixed source alias’s modularity/weight components. Compatible-system preservation is conditional on the stated system; it does not use any theorem that produces lifts or proves modularity.
2. (ii) follows from compatibility, (i), and two observations: for t different from 2 and r a prime different from t, the reduction map is bijective on a dihedral subgroup D_{2t^a} of PGL_2(Q_r-bar) sitting inside PGL_2(O); and for r <= max(Q(N(rho-bar)/q^2), p) one has max(Q(N(rho-bar_r)/q^2), r) <= max(Q(N(rho-bar)/q^2), p).
3. (i): since t divides q+1 and not q-1, rho-bar restricted to D_q is irreducible, hence so is rho-bar; since t > 5 the projective image cannot be A_5.
4. If the image were solvable then by Dickson the projective image is dihedral, so rho-bar is induced from a quadratic K unramified outside the primes ramified in rho-bar; the primes s different from q at which rho-bar is ramified satisfy q = 1 mod s (and 1 mod 8 if s = 2), so q either splits or ramifies in K. Splitting contradicts irreducibility of rho-bar restricted to D_q; ramification contradicts t being odd.
5. t exceeds each new residual characteristic r in the bound, so reduction preserves its prime-power inertia order. New prime divisors away from q are bounded by max(Q(N/q²),p), using the Nat.maxPrimeFac product/power API. The new good-dihedral threshold therefore does not exceed the original one.

**Imports.**

- `ClassicalSerreModularity:R27.1/good-dihedral-prime-definition`
- `ArithmeticGaloisRepresentations:R01.4`
- `ArithmeticGaloisRepresentations:R01.5`
- `PotentialModularityAndCompatibleSystems:R24.6/residual-members`
- `mathlib:Nat.maxPrimeFac_mul`
- `mathlib:Nat.maxPrimeFac_pow`

**Acceptance.**

- Check the bijectivity of reduction on D_{2t^a} directly for a small t and r, and check it fails when r = t
- Check the two contradictions in (i) on an explicit K, confirming that the 1 mod 8 clause of Definition 2.1 is what closes the s = 2 case

**Source locators.**

- kw-serre-modularity-I: Lemma 6.3, p. 11 of the preprint. Lemma 6.3.
- kw-serre-modularity-I: proof of Lemma 6.3(i), p. 12 of the preprint. The step using (ii).

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/GoodDihedral`, namespace `TauCeti.SerreConjecture`

#### Dickson's classification, its p = 2 refinement, and the dihedral and degenerate weight lemmas

**Lemma.** `ClassicalSerreModularity:R27.1/dickson-and-the-dyadic-solvable-refinement`. Dickson: for any prime p, a finite subgroup of GL_2(F_p-bar) acting irreducibly on the plane has projective image isomorphic to a dihedral group, A_4, S_4, A_5, PSL_2(F_0) or PGL_2(F_0) for F_0 a finite subfield of F_p-bar; PSL_2(F_0) is simple nonabelian as soon as |F_0| >= 4. Lemma 6.1: a finite SOLVABLE subgroup G of GL_2(F_2-bar) acting irreducibly has dihedral projective image. Lemma 6.2(i): an S-type rho-bar with dihedral projective image is modular, and arises from S_{k(rho-bar)}(Gamma_1(N(rho-bar))). Lemma 6.2(ii): if rho-bar is of S-type, p >= 3, 2 <= k(rho-bar) <= p+1, and rho-bar restricted to G_{Q(mu_p)} is reducible, then k(rho-bar) is (p+1)/2 or (p+3)/2.

**Input conditions.**

- Lemma 6.1 is over F_2-bar and uses that an element of GL_2(F_2-bar) of 2-power order has order 1 or 2, and that a Sylow 2-subgroup is unipotent
- Lemma 6.2(i) at p = 2 is not 'well known': it goes through the method of Proposition 10 of Serre's Duke paper (the 'trick of Serre'), with the refined level and weight coming from a separate theorem of Wiese
- Lemma 6.2(ii) needs p > 2 (the projectivisation must be tamely ramified at p) and the normalized weight range 2 <= k <= p+1

**Construction/proof.**

1. Lemma 6.1: by Dickson the projective image is dihedral, A_4 or S_4; S_4 is excluded because 2-power-order elements of GL_2(F_2-bar) have order at most 2; A_4 is excluded because it has a normal subgroup of order 4, which forces G into the upper triangular matrices, contradicting irreducibility.
2. Lemma 6.2(ii): for p > 2 the projectivisation is tamely ramified at p so its inertia image is cyclic; as the quadratic subfield of Q(mu_p) is ramified at p, that image has order 2, and the two possible weights follow from Serre's definition of k.

**Imports.**

- `ArithmeticGaloisRepresentations:R01.4`
- `GL2AutomorphicRepresentationsAndTransfer:R17.5`
- `GL2AutomorphicRepresentationsAndTransfer:R17.6`
- `SerreWeightAndLevelOptimisation:R20.5`
- `AlgebraicModularFormsAndSerreWeights:R15.4`

**Acceptance.**

- Check Lemma 6.2(ii) against Serre's weight recipe directly, recovering (p+1)/2 and (p+3)/2 from the level-1 and level-2 tame cases
- Check that Lemma 6.1 fails over F_p-bar for odd p, by exhibiting a solvable irreducible subgroup with projective image A_4

**Ownership.** Stable mixed source alias retained under accepted RS-06 componentMigrations. No component is re-owned here: Dickson and KW Lemma 6.1 -> R01.4; Lemma 6.2(i) modularity -> R17.5/R17.6, exact weight/level -> R20.5; Lemma 6.2(ii) normalized-weight application -> R15.4. Early good-dihedral image arguments import only R01.4, not this whole alias.

**Source locators.**

- kw-serre-modularity-I: Lemma 6.1, p. 10 of the preprint. Lemma 6.1.
- kw-serre-modularity-I: Lemma 6.2, p. 11 of the preprint. Lemma 6.2(i).
- ribet-semistable: Published Proposition 2.2 proof, pp.279–280. An analogy for the component-owned inertia argument, not a direct proof of general bad-dihedral weights. E14 corrects center to index-two rotation subgroup; retain semistability and cyclotomic determinant in the theorem itself.

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/GoodDihedral`, namespace `TauCeti.SerreConjecture`

### R27.2. Fixed-conductor-count characteristic induction

#### The three families of hypotheses (L_r), (W_r) and (D_r)

**Definition.** `ClassicalSerreModularity:R27.2/hypotheses-Lr-Wr-and-Dr`. For an integer r >= 1: (L_r) all rho-bar of S-type are modular provided (a) rho-bar is locally good-dihedral, (b) k(rho-bar) = 2 IF p = 2, and (c) N(rho-bar) is odd and divisible by at most r primes. (W_r) the same with (b) strengthened to k(rho-bar) = 2 for every p. For an integer r >= 0: (D_r) all rho-bar of S-type are modular provided (a) rho-bar is locally good-dihedral, (b) the residue characteristic of rho-bar is an odd prime, and (c) N(rho-bar) is NOT divisible by 2^{r+1}. Obviously (L_r) implies (W_r). Note that (L_r) and (W_r) require the conductor to be odd, while (D_r) allows even conductor with bounded 2-valuation and instead forbids p = 2.

**Input conditions.**

- all three hypotheses are restricted to locally good-dihedral rho-bar; this is the device that avoids residually degenerate modularity lifting beyond what Theorem 1.1 already uses
- (L_r) imposes weight 2 only at p = 2; (W_r) imposes it at all p
- (D_r) bounds v_2(N(rho-bar)) by r, and excludes p = 2 entirely

**Construction/proof.**

1. The hypotheses are stated outright. The source records the two consequences used: by Theorem 3.4, (D_0) implies Serre's conjecture for S-type rho-bar in odd characteristic with N(rho-bar) odd and for rho-bar in characteristic 2 with k(rho-bar) = 2; and (D_1) implies Serre's conjecture in characteristic 2 and in odd characteristic with N(rho-bar) not divisible by 4.

**Imports.**

- `ClassicalSerreModularity:R27.1/good-dihedral-prime-definition`
- `AlgebraicModularFormsAndSerreWeights:R15.6`

**Acceptance.**

- Check that (W_r) does not trivially give (L_r): (L_r) covers every weight at odd p while (W_r) covers only weight 2, so Theorem 3.2 is a genuine statement (the source notes only the obvious converse, that (L_r) implies (W_r))
- Check the bookkeeping 'at most r primes' against an example where a change of prime adds a divisor to the conductor

**Uses.**

- `ClassicalSerreModularity:R27.2/theorem-3-2-weight-reduction`: (W_r) ⇒ (L_r).
- `ClassicalSerreModularity:R26.6/corollary-8-1-ii-and-the-statement-W1`: (W_1).
- `ClassicalSerreModularity:R27.3, R27.5`: Conductor-count and dyadic induction need the direction of monotonicity and the distinction between odd conductor and bounded dyadic valuation.

**Required API.**

- `TauCeti.SerreConjecture.HypL` (constructor): For r≥1 quantify over every S-type finite-field residual representation; if it is good-dihedral, N is odd with at most r distinct prime divisors and p=2 implies k=2, conclude modularity.
- `TauCeti.SerreConjecture.HypW` (constructor): For r≥1 use the same quantification with k=2 in every characteristic.
- `TauCeti.SerreConjecture.HypD` (constructor): For r≥0 quantify over S-type good-dihedral representations of odd characteristic with 2^(r+1) not dividing N, and conclude modularity.
- `TauCeti.SerreConjecture.hypL_imp_hypW` (relation): For r≥1, HypL r implies HypW r by restriction to weight two.
- `TauCeti.SerreConjecture.hypL_mono` (relation): For 1≤r≤s, HypL s implies HypL r; the reverse direction is not a consequence of inclusion.
- `TauCeti.SerreConjecture.hypW_mono` (relation): For 1≤r≤s, HypW s implies HypW r.
- `TauCeti.SerreConjecture.hypD_mono` (relation): For r≤s, HypD s implies HypD r: exclusion of 2^(r+1) implies exclusion of 2^(s+1).

**Discriminating tests.**

- `hypL_imp_hypW_test` (compatibility): For r≥1 and any supplied proof of HypL r, specialize it to an S-type good-dihedral weight-two representation with odd N and at most r prime factors to obtain exactly HypW r.
- `hypD_even_conductor` (non-example): For an S-type good-dihedral representation with odd characteristic and N=2q² (q odd), the D1 conductor premise holds while the Lr/Wr odd-conductor premise fails. Do not assert that such a representation exists merely from the integer example.
- `hyp_count_primes` (computation): For distinct odd primes q,3,5, conductor N=3·5·q² has three distinct prime factors: it satisfies the L3/W3 conductor bound and fails the L2/W2 bound, regardless of the exponent 2 at q.
- `hyp_dyadic_weight` (degenerate): In characteristic 2 the Lr premise admits weight 2 and rejects weight 4; in odd characteristic Lr permits both weights whereas Wr rejects weight 4.

**Source locators.**

- kw-serre-modularity-I: §3.1, p. 5 of the preprint. (L_r).
- kw-serre-modularity-I: Theorem 3.4, p. 6 of the preprint. (D_r).

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/GoodDihedral`, namespace `TauCeti.SerreConjecture`

#### The explicit prime-gap inequalities that make the weight recursion terminate

**Lemma.** `ClassicalSerreModularity:R27.2/prime-gap-estimates-driving-the-weight-recursion`. KW §7’s arithmetic application imports the odd estimate (1) from R26.3/chebyshev-next-prime and the consecutive-prime bound from R26.3/next-prime-ratio. In the exact next-prime proof, if P−1 has no odd factor then P is Fermat and 2^e∥P−1 with e≥4 (P≥17). The separate dyadic requirement is (2^(e−1)+2)P+(2^(e−1)−2)≤2^e p. It implies (2^(e−1)+2)(P−1)+2·2^e≤(p+1)2^e, KW (4). Choose an even exponent i in [(P−1)/2, ((2^(e−1)+2)/2^e)(P−1)], whose length is 2 when P is Fermat. For odd ℓ use the half-open interval from R26.3. KW’s r counting conductor primes is never used as e. The decimal printed 1.46 has a repeating bar and denotes exactly 22/15.

**Input conditions.**

- the inequalities are needed only for p >= 5; smaller primes are handled by the separate mod 3 and mod 5 arguments
- Case (ii) requires the prime-power exponent e≥4, i.e. 16 divides P−1; e=1,2,3 are not covered. The conductor-count r stays fixed and is unrelated to e.
- the numerical verification for p <= 31 is by hand and is a finite exceptional check, not a consequence of the asymptotic estimate
- Khare's level-one paper [24] (not the Annals paper) proves the stronger statement that one can always find P with (i), for example P the smallest non-Fermat prime > p

**Construction/proof.**

1. For a non-Fermat next prime P, the shared odd estimate applies; choose the exact odd prime-power divisor.
2. For p≤31 the only next Fermat case in the induction is (p,P,e)=(13,17,4), which satisfies the dyadic inequality 176≤208 (strictly, not with equality).
3. For p>31 use P/p<22/15≤3/2−1/p and 2^e/(2^(e−1)+2)≥3/2 for e≥4; the correction coefficient is ≤1.
4. Multiply by positive denominators to derive (4). The closed dyadic interval contains an even i in each admissible even exponent coset; its endpoint/parity contract is checked explicitly.

**Imports.**

- `ClassicalSerreModularity:R26.3/chebyshev-next-prime`
- `ClassicalSerreModularity:R26.3/next-prime-ratio`
- `ClassicalSerreModularity:R26.3/finite-auxiliary-prime-checks`
- `ClassicalSerreModularity:R26.3/weight-interval-containment`

**Acceptance.**

- Verify (1) and (2) by direct computation for every prime p <= 31, and record the list of (p, P, l^r) triples used
- Verify that (3) and (4) really give a nonempty integer interval for the exponent i in each case, including the parity constraint when l = 2

**Source locators.**

- kw-serre-modularity-I: §7, p. 12 of the preprint. The estimates.
- kw-serre-modularity-I: §7, Remark, p. 12 of the preprint. Khare's stronger form.

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/GoodDihedral`, namespace `TauCeti.SerreConjecture`

#### Theorem 3.2 (reduction to weight 2): (W_r) implies (L_r), with its three-part proof

**Theorem.** `ClassicalSerreModularity:R27.2/theorem-3-2-weight-reduction`. For a positive integer r, (W_r) implies (L_r). The proof is an induction on the residue characteristic p, with the cases p = 3 and p = 5 done separately and a general inductive step. Mod 3: lift a q-dihedral rho-bar with k(rho-bar) <= 4 by Theorem 5.1(2), pass to rho_2; rho-bar_2 is q-dihedral hence non-solvable, k(rho-bar_2) = 2 by almost strict compatibility, and N(rho-bar_2) has at most r+1 prime divisors, namely those of N(rho-bar) together with 3. If rho-bar_2 is unramified at 3 one concludes by (W_r) and Theorem 4.1. Otherwise rho-bar_2 restricted to I_3 is nontrivial unipotent (because omega_3 has order 2), so rho-bar_2 restricted to D_3 is, up to unramified twist, upper triangular with diagonal (chi_2, 1); apply Theorem 5.1(4) with chi' = omega_{3,2}^2 and conclude through rho-bar'_3. Mod 5: same with chi' = omega_5^2 in Theorem 5.1(3), producing rho-bar'_5 of weight 4, then splitting on whether 3 divides N(rho-bar'_5). Inductive step: let P be the next prime after p, choose a prime power l^e exactly dividing P-1 satisfying (1) or (2) of section 7, and choose the twisting exponent i in the interval [(2m+1)^{-1} m (P-1), (m+1)(2m+1)^{-1}(P-1)] (respectively an even i in [(P-1)/2, (2^{e-1}+2)/2^e (P-1)] when l = 2); the estimates (3) and (4) then give k(rho-bar'_P) <= p+1 after a twist. Fix the conductor-count r throughout. After the return residual mod-P representation has weight≤p+1, it is still in characteristic P, so induction cannot yet be invoked. If p divides its conductor, use the weight-two lift and reduce at p; its prime support is contained in that of the prime-to-p part of P·N. If p does not divide its conductor, use the crystalline lift of that reduced weight and reduce at p with no added conductor prime. In both cases at most r primes divide the odd conductor, the good-dihedral prime persists, and the modularity hypothesis applies in the strictly smaller characteristic p. Transfer modularity through the third, second and first systems and restore twists.

**Input conditions.**

- throughout, rho-bar is locally good-dihedral, p is odd, N(rho-bar) is odd and has at most r prime divisors
- the mod 3 step uses that omega_3 has order 2, so ramification at 3 is unipotent; the mod 5 step uses that omega_5 has order 4
- the choice of i in the inductive step is constrained by the prime estimates AND, when l = 2, by a parity condition needed for the lift to be odd
- at every change of prime the new residual representation is again q-dihedral by Lemma 6.3, which is what keeps the residually degenerate cases out of reach

**Construction/proof.**

1. Base cases p = 3 and p = 5 are run explicitly, each splitting on whether the auxiliary residual representation is ramified at the old prime.
2. In the general step, Theorem 5.1(2) gives a weight-2 lift with prescribed inertial Weil-Deligne parameter at P; reduction mod l gives rho-bar_l, q-dihedral with conductor divisible by at most r+1 primes.
3. If rho-bar_l is unramified at P the conductor drops to r primes and the inductive hypothesis (in characteristic l <= p) applies.
4. Otherwise Theorem 5.1(3) is applied to a twist rho-bar'_l with 2 <= k <= l+1 (when l is odd), producing a system whose P-adic member has residual weight <= p+1 by the estimates, and whose conductor is odd with at most r prime divisors.
5. Check removal of the foil from fixed ramification: if ℓ does not divide the original N, the second system is crystalline of weight two at ℓ and has unramified Weil–Deligne parameter there, so ℓ does not divide the return conductor. If ℓ divides the return conductor, it already divided N. Thus the asserted ≤r conductor count is justified; almost strict compatibility without this local type is insufficient.
6. Modularity is then transported back along the two systems, which are linked at l, by two applications of Theorem 4.1.
7. It remains to show rho-bar'_P modular (and, at p = 5, rho-bar'_5): split on whether p (resp. 3) divides N(rho-bar'_P). If it does, lift by Theorem 5.1(2) and reduce mod p, obtaining an odd conductor with at most r prime divisors (a subset of those of the prime-to-p part of P N(rho-bar'_P)); if it does not, lift by Theorem 5.1(1) and reduce mod p. In both cases the residual representation is q-dihedral and modular by the inductive hypothesis (at p = 5, by the mod 3 case), and Theorem 4.1 gives modularity of the lift, hence of rho-bar'_P.
8. Fix r≥1 and use strong induction on the natural-number residue characteristic; p=2 is HypW itself, p=3 and p=5 use the explicit source branches.
9. In the general step for new prime P let p be its predecessor. Return to weight≤p+1 at P, then perform the final reduction at p described in the statement. This, not the weight change itself, strictly lowers the induction variable.
10. All reductions lie below max(Q(N/q²),P), so Lemma 6.3 preserves the good-dihedral prime. Count prime support when exchanging p for P, without confusing it with the prime-power exponent e.

**Imports.**

- `ClassicalSerreModularity:R27.2/hypotheses-Lr-Wr-and-Dr`
- `ClassicalSerreModularity:R27.2/prime-gap-estimates-driving-the-weight-recursion`
- `ClassicalSerreModularity:R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved`
- `PotentialModularityAndCompatibleSystems:R24.5/kw-theorem-5-1-systems`
- `PotentialModularityAndCompatibleSystems:R24.4/kw-theorem-4-1`
- `PotentialModularityAndCompatibleSystems:R24.6/linked-systems-modularity-transfer`
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.6`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5`

**Acceptance.**

- Run the smallest nontrivial transition (p = 5, P = 7) and exhibit the admissible interval of exponents i explicitly
- Check that at each recursive call either the residue characteristic strictly decreases or the number of prime divisors of the conductor strictly decreases, and record the well-founded measure; a change of prime alone is not a decrease
- The final reduction at the predecessor characteristic is mandatory. Establish that the foil does not add a new conductor prime by the crystalline weight-two local condition; do not infer this from a numerical weight bound.

**Source locators.**

- kw-serre-modularity-I: §8.2, p. 13 of the preprint. The mod 3 case.
- kw-serre-modularity-I: §8.2, p. 14 of the preprint. The inductive step.
- kw-serre-modularity-I: §8.2, p. 15 of the preprint. The weight bound.

**Atlas planet.** Reduction to weight two

**Library destination.** `TauCeti/NumberTheory/SerreConjecture/GoodDihedral`, namespace `TauCeti.SerreConjecture`

## Supplier contracts

These 20 requests are open. The consumer imports each exact interface; it does not reconstruct the supplier theorem or treat a stage name as evidence that the theorem exists.

### 1. `PotentialModularityAndCompatibleSystems:R24.5`

**Required output.** Taylor's potential modularity over totally real Galois fields of even degree for ρ̄ with non-solvable image, with ordinary (resp. crystalline) cuspidal π of the prescribed type, and the resulting compatible systems (Brauer induction and Arthur–Clozel). Include the published Annals Theorem4.2(ii) semistable weight-two compatible-system contract. Its abelian-variety realisation is requested separately from R25.5 by the R26.6 consumer; R24 does not acquire a backward dependency on R25.

**Consumers.**

- `ClassicalSerreModularity:R26.2/lifting-method-flatness`
- `ClassicalSerreModularity:R26.6/corollary-1-2-proof`

**Status.** open

### 2. `AlgebraicModularFormsAndSerreWeights:R15.6`

**Required output.** Serre's weight k(ρ̄) and conductor N(ρ̄), S-type representations and the meaning of 'arises from'.

**Consumers.**

- `ClassicalSerreModularity:R26.1/level-one-theorem-and-the-meaning-of-arises-from`
- `ClassicalSerreModularity:R26.1/corollary-1-2-conductor-a-prime-and-its-corrected-proof`
- `ClassicalSerreModularity:R26.3/serre-weight-twist`
- `ClassicalSerreModularity:R26.6/level-one-proof-assembly`
- `ClassicalSerreModularity:R26.6/finiteness-corollary-1-3`
- `ClassicalSerreModularity:R27.1/good-dihedral-prime-definition`
- `ClassicalSerreModularity:R27.1/dickson-and-the-dyadic-solvable-refinement`
- `ClassicalSerreModularity:R27.2/hypotheses-Lr-Wr-and-Dr`

**Status.** open

### 3. `ArithmeticGaloisRepresentations:R01.4`

**Required output.** Residual images: Dickson's classification and oddness.

**Consumers.**

- `ClassicalSerreModularity:R26.2/minimal-weight-two-lift`
- `ClassicalSerreModularity:R27.1/good-dihedral-prime-definition`
- `ClassicalSerreModularity:R27.1/dickson-and-the-dyadic-solvable-refinement`
- `ClassicalSerreModularity:R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved`

**Status.** open

### 4. `OrdinaryAutomorphicFormsAndModularityLifting:R21.6`

**Required output.** The exported ordinary and residually reducible lifting statements (Skinner–Wiles, Wiles, Taylor–Wiles, Diamond, Kisin) with their hypotheses individually.

**Consumers.**

- `ClassicalSerreModularity:R26.4/level-one-lifting-lemma`
- `ClassicalSerreModularity:R26.4/degenerate-branches`
- `ClassicalSerreModularity:R27.2/theorem-3-2-weight-reduction`

**Status.** open

### 5. `GL2ModularityLifting:R22.1`

**Required output.** Minimal R = T over totally real fields (Fujiwara; Taylor §3) for ρ̄|_{G_F} with non-solvable image.

**Consumers.**

- `ClassicalSerreModularity:R26.2/lifting-method-flatness`

**Status.** open

### 6. `SerreWeightAndLevelOptimisation:R20.6`

**Required output.** Ribet's level lowering and Edixhoven's weight optimisation: modular of some weight and level ⇒ modular of weight k(ρ̄) and level N(ρ̄). For the solvable-image branch of R26.2/minimal-weight-two-lift, also supply the Gross–Edixhoven ordinary weight-two realisation in S₂(Γ₁(N)∩Γ₀(p),ω_p^(k−2)) of an ordinary residual eigenform of normalized weight k, including the k=2 and k=p+1 local lift distinctions.

**Consumers.**

- `ClassicalSerreModularity:R26.6/level-one-proof-assembly`
- `ClassicalSerreModularity:R26.5/terminal-row-branch-contract`
- `ClassicalSerreModularity:R26.2/minimal-weight-two-lift`

**Status.** open

### 7. `LocalGaloisDeformationRings:R08.2`

**Required output.** Minimally ramified local lifting rings at ℓ ≠ p and their tangent spaces.

**Consumers.**

- `ClassicalSerreModularity:R26.2/local-ring-at-q-smooth`

**Status.** open

### 8. `LocalGaloisDeformationRings:R08.3`

**Required output.** Crystalline lifting rings of weight k ≤ p + 1 with fixed determinant, smooth of relative dimension h⁰(D_p, Ad⁰ρ̄) + 1.

**Consumers.**

- `ClassicalSerreModularity:R26.2/nebentype-lift-at-q`
- `ClassicalSerreModularity:R26.4/level-one-lifting-lemma`

**Status.** open

### 9. `LocalGaloisDeformationRings:R08.6`

**Required output.** Ordinary and Barsotti–Tate local rings of the minimal weight-2 type (Taylor E3–E4).

**Consumers.**

- `ClassicalSerreModularity:R26.2/minimal-weight-two-lift`

**Status.** open

### 10. `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5`

**Required output.** After R07.4 descent, provide Breuil–Mézard Prop.6.1.1 and Savitt Theorem6.11/Corollary6.15(1),(2)/Remark6.17 for odd p, potentially crystalline Hodge–Tate {0,1}, tame niveau-one/two types. For the Q_p(μ_p) niveau-one type, residually reducible implies ordinary up to a Teichmüller twist. Compute the up-to-cyclotomic-twist Serre weights i+2 or q+1−i for ω_q^i type and q+1−(i−j), i−j (i>j+1), or q (i=j+1) for the niveau-two type. Preserve the lattice/trivial-endomorphism hypothesis of Cor6.15 and use Remark6.17 only for its semisimplification extension; include the corrected i=1 corner in v3 Remark1.7. R24.5/R24.6 must consume this owner rather than R15.4 as a provider of integral classification. The BM author copy has now been read: Proposition 6.1.1 concerns the nonscalar principal-series type ω_p^i⊕1, 1≤i≤p−2, HT {0,1} and any stable lattice, with no End(ρ̄)=F condition. Reducibility excludes the intermediate-slope case. Its introduction to §6 explicitly omits calculation details, which the owning integral-classification plan must supply.

**Consumers.**

- `ClassicalSerreModularity:R26.2/compatible-system-lifts`
- `ClassicalSerreModularity:R26.4/local-reducibility-ordinary`
- `ClassicalSerreModularity:R27.2/theorem-3-2-weight-reduction`

**Status.** open

### 11. `AlgebraicModularFormsAndSerreWeights:R15.4`

**Required output.** Provide the local classical Serre-weight recipe, coefficient/twist invariance and level-one determinant parity; the bad-dihedral normalized-weight application of KW Lemma6.2(ii)/DP v2 Lemma1.14 is owned here, after R01.4. Its niveau-one/two split gives k=(p+1)/2 or (p+3)/2 for p≥3, S-type and 2≤k≤p+1. Ribet Prop2.2 is now read: its theorem assumes semistable and cyclotomic determinant; use the analogous inertia/rotation-subgroup argument, not a false direct general application. In Ribet’s published Proposition 2.2 proof p.280, “center” must mean the index-two rotation subgroup (E14); the analogous argument must use that subgroup. Also export the locally irreducible bad-dihedral weight (p+3)/2 case for residuals ramified at an auxiliary prime, rather than applying the level-one theorem to them.

**Consumers.**

- `ClassicalSerreModularity:R26.3/serre-weight-twist`
- `ClassicalSerreModularity:R27.1/good-dihedral-prime-definition`
- `ClassicalSerreModularity:R27.1/dickson-and-the-dyadic-solvable-refinement`
- `ClassicalSerreModularity:R26.4/ordinary-reduction-and-parity`
- `ClassicalSerreModularity:R26.3/level-one-induction-scheme`
- `ClassicalSerreModularity:R26.4/level-one-lifting-lemma`
- `ClassicalSerreModularity:R26.4/degenerate-branches`
- `ClassicalSerreModularity:R26.6/corollary-8-1-ii-and-the-statement-W1`
- `ClassicalSerreModularity:R26.5/terminal-row-branch-contract`

**Status.** open

### 12. `AlgebraicModularFormsAndSerreWeights:R15.3`

**Required output.** For fixed level Γ₁(p²), the integral Hecke algebra acting on weight-two cusp forms is a finite Z-module; after reduction mod p it has finitely many eigencharacters over F̄_p. Supply the weight-two realisation used in Khare Cor1.3, with finite cyclotomic twists.

**Consumers.**

- `ClassicalSerreModularity:R26.6/finiteness-corollary-1-3`

**Status.** open

### 13. `ArithmeticGaloisRepresentations:R01.5`

**Required output.** Supply the canonical inertia/restriction and prime-to-characteristic Artin conductor API. For semisimple residual abelian characters unramified outside p, the Kronecker–Weber/class-field comparison forces factorisation through the prime-to-p quotient of Z_pˣ, hence finitely many F̄_p-valued characters (order divides p−1). For q=2, Artin exponent one in odd residual characteristic gives tame inertia with a fixed line; Frobenius forces the quotient character χ=χ², hence χ=1 and the inertia image is unipotent of p-power order. This supplies the semistability premise for Annals Theorem5.2(ii).

**Consumers.**

- `ClassicalSerreModularity:R26.6/finiteness-corollary-1-3`
- `ClassicalSerreModularity:R27.1/good-dihedral-prime-definition`
- `ClassicalSerreModularity:R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved`
- `ClassicalSerreModularity:R26.6/corollary-1-2-proof`

**Status.** open

### 14. `GL2AutomorphicRepresentationsAndTransfer:R17.5`

**Required output.** Import odd-characteristic dihedral/solvable residual modularity from the precise Langlands–Tunnell and theta-series results; this is the modularity component of RS-06’s stable mixed alias, separate from Dickson image classification.

**Consumers.**

- `ClassicalSerreModularity:R27.1/dickson-and-the-dyadic-solvable-refinement`
- `ClassicalSerreModularity:R26.4/level-one-lifting-lemma`

**Status.** open

### 15. `GL2AutomorphicRepresentationsAndTransfer:R17.6`

**Required output.** Export solvable residual modularity over Q including the p=2 dihedral refinement; verify absolute irreducibility, oddness and coefficient-field hypotheses, not merely an abstract finite-image assertion.

**Consumers.**

- `ClassicalSerreModularity:R26.4/degenerate-branches`
- `ClassicalSerreModularity:R27.1/dickson-and-the-dyadic-solvable-refinement`
- `ClassicalSerreModularity:R26.2/minimal-weight-two-lift`

**Status.** open

### 16. `SerreWeightAndLevelOptimisation:R20.5`

**Required output.** Export exact-weight/exact-level dihedral modularity from R17 existence and the R20.2–R20.4 optimisation contracts. This is the weight/level component of the stable mixed source alias.

**Consumers.**

- `ClassicalSerreModularity:R27.1/dickson-and-the-dyadic-solvable-refinement`
- `ClassicalSerreModularity:R26.4/level-one-lifting-lemma`

**Status.** open

### 17. `GL2ModularityLifting:R22.6`

**Required output.** Export nonordinary potentially BT modularity over Q for the tame Q_p(μ_p) type, with residual cyclotomic restriction absolutely irreducible, and crystalline lifting in 2≤k≤p+1 with the ordinary endpoint handled explicitly. Include the semistable weight-two transition in the corrected prime-conductor proof.

**Consumers.**

- `ClassicalSerreModularity:R26.4/level-one-lifting-lemma`
- `ClassicalSerreModularity:R26.4/degenerate-branches`
- `ClassicalSerreModularity:R26.6/level-one-proof-assembly`

**Status.** open

### 18. `SmallRamificationAndAbelianVarietyBaseCases:R25.5`

**Required output.** Export the GL2-type abelian-variety realisation and reduction contract needed for the q=2 application of published KW Annals Theorem4.2(ii)/5.2(ii): after a semistable weight-two minimal lift/system with absolutely irreducible cyclotomic restriction, obtain dim A=[E:Q]≥1, good reduction outside 2 and semistable reduction at 2. Use the existing GL2-type, descent/Snowden realisation and reduction nodes; verify the local and coefficient hypotheses for p=3 as well. The conductor-two residual theorem is an R26.6 application of this contract and R25.4/Schoof, not a pre-existing R25 target.

**Consumers.**

- `ClassicalSerreModularity:R26.6/corollary-1-2-proof`

**Status.** open

### 19. `PotentialModularityAndCompatibleSystems:R24.5`

**Required output.** For Khare Corollary 5.5 import the general crystalline weight-k minimal lift (R24.3/kw-annals-minimal-lifts, Annals Theorem 3.3) and type-(1) general-weight system (KW I Theorem 5.1(1), Annals Theorem 4.2(i)), with absolute irreducibility on G_{ℚ(μ_q)}, 2≤k≤q+1 and k≠q. At a new odd prime p with k≤p+1 obtain a crystalline member unramified away from p and the residual normalized-weight contract from R24.6/R15.4; deal with dihedral residuals separately. A weight-two compatible system is insufficient.

**Consumers.**

- `ClassicalSerreModularity:R26.4/level-one-lifting-lemma`

**Status.** open

### 20. `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`

**Required output.** Supply the scalar crystalline residual-reducibility criterion of Breuil–Mézard Proposition 4.1.1 (author-copy pp.30–31), as an application of the integral Fontaine–Laffaille classification with coefficient action and arbitrary stable lattice: for two-dimensional crystalline V over ℚ_p of HT {0,k−1}, 1<k<p, a locally irreducible V has irreducible residual reduction of niveau two. Thus a reducible reduction forces the ordinary branch. The foil uses only k=2<p, safe even at p=3; the k=p+1 endpoint belongs to R08/R22 and is not inferred from this criterion.

**Consumers.**

- `ClassicalSerreModularity:R26.4/level-one-lifting-lemma`
- `ClassicalSerreModularity:R26.4/degenerate-branches`

**Status.** open

## Source findings

All seven findings retain the previous independent reviewer’s confirmation. The passages are not reproduced; the descriptions and corrections below are in our own words. A finding about an unavailable edition is explicitly an author-reported correction.

### ClassicalSerreModularity/E1

**Source and locator.** khare-level-one, §6.1, weights 22–30, p. 25 of the preprint (arXiv v1)

**Discrepancy.** The source invokes Proposition 2.2 for a lift ρ′ of the representation mod 7, requiring no ramification outside 3, 19 and the Barsotti-Tate property at 7.

**Correction.** unramified outside 7, 29 (the mod-7 representation is ramified only at 7 and 29).

**Reason.** The row concerns ρ̄ mod 29 of level one and its mod-7 companion ρ̄_7, which is unramified outside 7 and 29; the list '3, 19' is copied from the previous row (weights 14–20: the mod-3 companion of a mod-19 representation).

**Impact.** misprint; affects nothing. new: present in arXiv v1; the published version (Duke Math. J. 134 (2006)) was not checked

**Edition search.**

- arXiv math/0504080 (v1 only).
- The Duke Math. J. version was not obtained.

**Independent review.** confirmed: Confirmed in Khare arXiv v1 §6.1 p.25: the preceding P=29, ℓ=7 construction has support {7,29}; {3,19} belongs to the prior row. No claim about the unavailable Duke text.

### ClassicalSerreModularity/E2

**Source and locator.** khare-level-one, §6.1, weight 32, pp. 25–26 of the preprint (arXiv v1)

**Discrepancy.** The source takes 5 as the foil prime and constructs a compatible system (ρ′ λ) of weight 2 with nebentype ω16 31 at 31; modularity of this system gives modularity of ¯ρ. It then considers a prime above 31.

**Correction.** nebentypus ω_31^{18} (or ω_31^{12}), giving residual weights 20 or 14, both already known.

**Reason.** A weight-32 = p + 1 representation mod 31 has a minimal weight-2 lift semistable at 31, so its mod-5 member is unipotent on I_31 (χ = 1 in Proposition 2.2) and the available nebentypes are η_31^i = ω_31^{6i} (5 ∥ 30). 16 is not a multiple of 6 (nor of 10, for the foil 3). The general interval (12, 18] of §6.2 (m = 2) gives j = 18.

**Impact.** error; affects nothing. new: present in arXiv v1; the published version was not checked

**Edition search.**

- arXiv math/0504080 (v1 only).
- The Duke Math. J. version was not obtained.

**Independent review.** confirmed: Confirmed in Khare arXiv v1 §6.1 pp.25–26: for P=31, ℓ^e=5, the exponent coset is 0 modulo 6. The printed 16 fails; 18 satisfies the half-open interval (12,18] and gives weights 20,14. No claim about the unavailable Duke text.

### ClassicalSerreModularity/E10

**Source and locator.** kw-serre-modularity-I, §7 and §8.2, preprint pp.12–15

**Discrepancy.** The source selects a prime divisor ℓ^r ||(P − 1), requiring it to meet estimate (1) or (2) from Section 7.

**Correction.** Write ℓ^e∥P−1 and 2^e∥P−1, keeping r for the fixed number of conductor prime divisors.

**Reason.** Theorem3.2 fixes r independently of the auxiliary prime P−1. Its prime-power exponent is not that conductor-count bound.

**Impact.** misprint; affects nothing. Known: PAPER-KHARE-WINTENBERGER-09-I/E4 and its independent review record the collision.

**Edition search.**

- KW I author preprint §7/§8.2
- Accepted paper extraction and review for PAPER-KHARE-WINTENBERGER-09-I.

**Independent review.** confirmed: Confirmed against KW I author-copy §7 p.12: the exponent in the 2-power estimate is independent of r in L_r/W_r. Use e≥4 throughout the application; retain the existing known correction attribution.

### ClassicalSerreModularity/E11

**Source and locator.** khare-level-one, §4, p.19 of arXiv:math/0504080v1

**Discrepancy.** The source claims the prime-counting function π(x) satisfies A(x/log(x)) ≤ π(x) ≤ B(x/log(x)) for x > 30, taking A = 0.921... and the ratio B/A to be 6/5 = 1.2.

**Correction.** Do not use this uniform prime-counting inequality. Use Rosser–Schoenfeld Theorem2/Corollary1 with exact thresholds, the finite auxiliary-prime checks, and the large-range 61/50 bound to derive the same required odd estimate.

**Reason.** π(31)=11 whereas B·31/log31<10 for the given constants; π(100)=25 whereas the claimed upper bound is below24.1. The classical Chebyshev constants cannot give this stated uniform π bound. The replacement proof yields P/p<1499/1000 for p≥21591 (at most one Fermat skip) and finite certified checks below it.

**Impact.** error; affects the proof. New discrepancy in v1; the inaccessible Duke version was not checked for a correction. The main auxiliary-prime conclusion is retained with a different proved-source route.

**Edition search.**

- Khare arXiv v1 §4 and bibliography.
- KW I §7 refers to Rosser–Schoenfeld rather than this exact uniform π bound.
- Rosser–Schoenfeld 1962 published scan p.69.
- Duke DOI PDF endpoint returned non-PDF access response.

**Independent review.** confirmed: Confirmed against Khare arXiv v1 §4 p.19: the claimed uniform upper bound with the displayed B=1.2A is false at x=31 and x=100 (π=11,25). The packet instead uses the exact Rosser–Schoenfeld Theorem 2/Corollary 1 domains. This does not assert that the next-prime conclusion fails or that the unavailable Duke edition contains the same wording.

### ClassicalSerreModularity/E12

**Source and locator.** savitt-cdt, Author correction reported in v3 Remark 1.7, p.4, concerning published Theorem 6.12(4), i=1; the older published text was not obtained

**Discrepancy.** The source identifies both the formulation and the proof of the published Theorem 6.12(4) as containing the mistake.

**Correction.** In the exceptional case m=1+(p+1)j, the two characters omega_2^(m+p) and omega_2^(pm+1) agree and have niveau one. The residual representation is split. Use the corrected v3 lattice statement.

**Reason.** Savitt’s author correction explicitly repairs the exceptional lattice classification without changing the principal results. Our tame ordinary/weight contract uses Theorem6.11 and Corollary6.15 with Remark6.17; it does not invoke the erroneous old corner.

**Impact.** error; affects nothing. Known author correction, arXiv v3 Remark1.7 (2010).

**Edition search.**

- Savitt arXiv:math/0404327v3 Remark1.7 and Corollary6.15/Remark6.17.

**Independent review.** confirmed: Confirmed as an author-reported correction: Savitt arXiv v3 Remark 1.7 explicitly identifies the published Theorem 6.12(4), i=1 error. Read v3 Theorem 6.11, Corollary 6.15 and Remark 6.17; did not independently obtain the older published text. Use the corrected v3 classification and preserve lattice hypotheses.

### ClassicalSerreModularity/E13

**Source and locator.** khare-level-one, Proof of Proposition 2.2, arXiv:math/0504080v1, running p.15, quadratic equation following AB=BA

**Discrepancy.** β² − βγ(χ′(τ) − 1) − ψ = 0

**Correction.** β² + βγ(χ′(τ) − 1) − ψ = 0

**Reason.** The preceding relation is α−β=γ(c−1) and αβ=ψ, hence β(β+γ(c−1))=ψ. For α=3, β=2, γ=1, c=2, ψ=6 the correct polynomial is zero and the printed one is −4. The derivative still reduces to 2r≠0 for odd p, so the Hensel and smoothness conclusions are unchanged.

**Impact.** misprint; affects nothing. new in the arXiv v1 text read; the published Duke version was not obtained and is not accused

**Edition search.**

- Khare author publication page and public errata search for Proposition 2.2 / the quadratic; no correction found.
- arXiv math/0504080v1 page image checked; Duke publisher endpoint did not serve a PDF.

**Independent review.** confirmed: Independently multiplied the displayed upper-triangular matrices and verified the printed sign on the rendered PDF page. The correction follows from the source’s two preceding equations.

### ClassicalSerreModularity/E14

**Source and locator.** ribet-semistable, Images of semistable Galois representations, published Pacific J. Math. special issue (1997), Proposition 2.2 proof, p.280, dihedral case

**Discrepancy.** The source defines Z to be G’s center.

**Correction.** let Z be the cyclic rotation subgroup of index two in G

**Reason.** A dihedral center has at most two elements and cannot contain the cyclic inertia subgroup of order p±1>2. Every cyclic subgroup of order>2 lies in the rotation subgroup. That subgroup has index two and gives the quadratic extension used in the proof; the theorem’s semistable cyclotomic-determinant hypotheses are unchanged.

**Impact.** misprint; affects nothing. new in the published text checked; no public correction found

**Edition search.**

- MSP published PDF, Proposition 2.2 proof, p.280.
- Public search for Ribet Images of semistable Galois representations errata and the exact center phrase; no correction found.

**Independent review.** confirmed: Checked the published paragraph and the elementary dihedral-group orders. The quadratic quotient uses the index-two rotation subgroup, not the center.

## Source-version register and reading boundaries

The ten hashes identify the public files actually checked for this revision. Locators distinguish preprint, author-copy and published pagination. Bibliographic titles identify sources; all mathematical specifications above are paraphrases. A scoped reading does not certify a whole paper.

### khare-level-one

**Source.** [On Serre's modularity conjecture for 2-dimensional mod p representations of Gal(Qbar/Q) unramified outside p](https://arxiv.org/pdf/math/0504080v1), Chandrashekhar Khare. arXiv:math/0504080v1, 5 April 2005. This is the preprint of the paper published as 'Serre's modularity conjecture: the level one case', Duke Math. J. 134 (2006), 557-589, under a different title. Locators give the preprint's own page numbers

**Version.** preprint; checked 2026-10-08; SHA-256 `3012a51759ad10695792bc8a2d1af75890f38d6ebacd37fb61e01bfdb89c9c2f`

**Reading boundary.** Preprint pp.1–3, 8, 11–28: scoped theorem statements, lifting and compatible-system contracts, §4 comparison, local lemmas/corollary and the complete conductor-one induction and terminal rows. Published Duke text not obtained.

### kw-serre-modularity-I

**Source.** [Serre's modularity conjecture (I)](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Chandrashekhar Khare and Jean-Pierre Wintenberger. Author's preprint (results.pdf) of the paper published as Invent. Math. 178 (2009), 485-504. Locators give the preprint's own running page numbers (2-21), which are NOT the Invent. Math. pages

**Version.** author copy; checked 2026-10-08; SHA-256 `3c389dc33e09fe847f5d8189ffd8915b5c1a73424e64e4fed6769829883bad82`

**Reading boundary.** Preprint pp.2–6, 10–16: S-type and modularity conventions, Definition 2.1, L/W/D hypotheses, Theorem 5.1 local contracts, Lemmas 6.1–6.3, §7 estimates, §8.2 weight recursion and §8.3 corrected corollaries. Later conductor/dyadic induction belongs to the sibling packet.

### bockle-appendix-2003

**Source.** [Appendix 1: On the isomorphism R_empty -> T_empty](https://arith-geom.github.io/ag-comp-arith-geom/assets/img/fileadmin/groups/arithgeo/templates/data/Gebhard_Boeckle/KhareAppboeckleNew2.pdf), Gebhard Bockle. Appendix to Chandrashekhar Khare, 'On isomorphisms between deformation rings and Hecke rings', Invent. Math. 154 (2003). Locators give that file's own page numbers 1-7 (mathematics pp.1–6, references p.7)

**Version.** author copy; checked 2026-10-08; SHA-256 `67de08f6a1958d6c350d6de0ad70839cc737cc14c9c3636ab68fb1bd638202de`

**Reading boundary.** Appendix pp.1–6: presentation, local tangent-space counts, finite flat complete-intersection criterion and minimal R=T argument; bibliography is not a further proof input.

### savitt-cdt

**Source.** [On a conjecture of Conrad, Diamond, and Taylor](https://arxiv.org/pdf/math/0404327v3), David Savitt. arXiv:math/0404327v3, 15 September 2010; corrected author version of Duke Math. J. 128 (2005)

**Version.** preprint; checked 2026-10-08; SHA-256 `e161ac6498c1a75fc8f981c25edd5e9390b19ceb40f174a25a1f6491390c115c`

**Reading boundary.** Corrected arXiv v3 p.4 Remark 1.7; pp.34–35 Theorem 6.11 and proof; pp.38–39 Corollary 6.15, proof and Remark 6.17. Older published Theorem 6.12 was not obtained.

### dp-serre

**Source.** [A simplified proof of Serre’s conjecture](https://arxiv.org/pdf/2108.07577v2), Luis Victor Dieulefait and Ariel Martín Pacetti. arXiv:2108.07577v2, 3 May 2022

**Version.** preprint; checked 2026-10-08; SHA-256 `0c6850dafda032f7a4008947c519b5aef8cc13762207bb67c36810170a8eebe6`

**Reading boundary.** arXiv v2 pp.7–10: Definition 1.12 and Lemmas 1.13–1.15 with their proofs, in particular the normalized bad-dihedral weight split without a conductor-one assumption.

### ribet-semistable

**Source.** [Images of semistable Galois representations](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p15-p.pdf), Kenneth A. Ribet. Pacific J. Math. 1997, special issue, 277–297

**Version.** published; checked 2026-10-08; SHA-256 `6d37cace879b9abdff0817709db114c93a186db0f2165aaeba443c48bb102443`

**Reading boundary.** PDF pp.2–4, printed pp.278–280: standing semistability/cyclotomic-determinant assumptions, Lemma 2.1 and Proposition 2.2 with the dihedral argument. No extension to arbitrary residual representations.

### rosser-schoenfeld

**Source.** [Approximate formulas for some functions of prime numbers](https://denisevellachemla.eu/Rosser-Schoenfeld-1962.pdf), J. Barkley Rosser and Lowell Schoenfeld. Illinois J. Math. 6 (1962), 64–94; scan of published article

**Version.** published; checked 2026-10-08; SHA-256 `8e37b06f82e09421bceb2502578c47b61469141f0287e6acedb70e01765ab556`

**Reading boundary.** Printed p.69 (PDF p.6): Theorem 2 and Corollary 1, inequalities (3.3)–(3.6) and domains. Analytic proof and published finite verification tables not read.

### bcdt-modularity

**Source.** [On the modularity of elliptic curves over Q: wild 3-adic exercises](https://www.imo.universite-paris-saclay.fr/~breuil/PUBLICATIONS/STW.pdf), Christophe Breuil, Brian Conrad, Fred Diamond and Richard Taylor. Breuil author copy, 80 PDF pages; Introduction printed pp.1–2 corresponds to published pp.843–845

**Version.** author copy; checked 2026-10-08; SHA-256 `cbbdc24c26cdfcbd77f0e084194643e8804a724f004eb02e431ead9d932c498d`

**Reading boundary.** Author-copy introduction pp.1–2, published pp.843–845: residual modularity and strong modularity conventions and the stated equivalence range ell≥3. The remaining proof is outside this job.

### kw-annals

**Source.** [On Serre’s conjecture for 2-dimensional mod p representations of Gal(Qbar/Q)](https://annals.math.princeton.edu/wp-content/uploads/annals-v169-n1-p05.pdf), Chandrashekhar Khare and Jean-Pierre Wintenberger. Annals of Mathematics 169 (2009), 229–253

**Version.** published; checked 2026-10-08; SHA-256 `154c0c2a2245e50cb2be3c82705f9176fe0e9b597424236ddca11299d38cdb22`

**Reading boundary.** Printed pp.235, 237, 239, 243–244, 247, 250–251: Theorem 3.3, Definition 4.1, Theorem 4.2 lifting/compatible-system statements and the relevant proof boundary, Theorem 5.2(ii) and proof, and §6.2. The full proof of Theorem 4.2 is imported from R24, not certified by this reading.

### breuil-mezard

**Source.** [Multiplicités modulaires et représentations de GL₂(ℤ_p) et de Gal(ℚ̄_p/ℚ_p) en ℓ=p](https://www.imo.universite-paris-saclay.fr/m/~breuil/PUBLICATIONS/multiplicite.pdf), Christophe Breuil and Ariane Mézard. Author copy, 82 PDF pages; Duke Mathematical Journal 115 (2002), 205–310. Locators use the author copy’s running page numbers, not Duke pagination.

**Version.** author copy; checked 2026-10-08; SHA-256 `ec42c9a450a7f7368a72670a3e9c54b75cad77802f18ac08d4dac6078bf7fa02`

**Reading boundary.** Printed pp.2, 30–31, 67–68: odd-prime convention, Proposition 4.1.1 and proof, §6.1 setup and Proposition 6.1.1 with its references to 6.1.2–6.1.3. The integral calculations in §6 beyond that boundary were not read and remain R07.5 work.

## Existing-library audit

Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Read Mathlib MaxPrimeFac and GeneralLinearGroup/Defs at 082e2d37; inspected Tau Ceti sources at f790474 using commit-qualified reads. The libraries supply matrix groups, prime factors, modular-form carriers and abelian-variety carriers. They do not supply the residual G_Q representation with canonical conductor/Serre-weight/modular-newform witness needed to type the headline statements. R26.1 process bookkeeping is excluded while its mathematical theorem/contracts remain. R26.5 consumes R25 arithmetic results rather than rebuilding the existing abelian-variety carrier. Read Nat.primeCounting at the exact Mathlib pin: its value counts primes ≤n, which fixes the floor adapter for real x. Independent reviewer codex-sHhOXz read all seven original declarations at Mathlib 082e2d3 and added the already existing Nat.exists_prime_lt_and_le_two_mul from Bertrand.lean, with n≠0. Checked all eight scoped reviewed-audit records; no built carrier or generic supplier theorem is newly planned. Full Chebotarev and GlobalNumberFields upstream documents were read; Chebotarev Layer 10 remains an upstream supplier, not a new plan. Revision 2, codex-vmLqNQ: independently rechecked all eight Mathlib declarations at the exact pin, including their nonzero/strict-range premises; inspected the pinned Tau Ceti absolute Galois and abelian-variety carriers and modular-form uses. An absolute Galois carrier exists; the missing interface is its assembled residual-representation/conductor/weight/attached-newform package. The suggested file continues to import Mathlib only.

| Existing declaration | Module | Contract consumed |
| --- | --- | --- |
| `mathlib:Nat.maxPrimeFac` | `Mathlib/Data/Nat/MaxPrimeFac.lean` | KW Q(n): greatest prime divisor for n>1; values 0 and 1 at those inputs. |
| `mathlib:Nat.maxPrimeFac_one` | `Mathlib/Data/Nat/MaxPrimeFac.lean` | Q(1)=1, exactly the KW convention. |
| `mathlib:Nat.isGreatest_maxPrimeFac` | `Mathlib/Data/Nat/MaxPrimeFac.lean` | For 1<n, Q(n) is prime, divides n, and dominates every prime divisor. |
| `mathlib:Nat.maxPrimeFac_mul` | `Mathlib/Data/Nat/MaxPrimeFac.lean` | For nonzero m,n, Q(mn)=max(Q(m),Q(n)); used for support bounds. |
| `mathlib:Nat.maxPrimeFac_pow` | `Mathlib/Data/Nat/MaxPrimeFac.lean` | For nonzero exponent e, Q(n^e)=Q(n). |
| `mathlib:Matrix.GeneralLinearGroup` | `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean` | The group of invertible matrices (matrix units); no new GL2 carrier is required. |
| `mathlib:Nat.primeCounting` | `Mathlib/NumberTheory/PrimeCounting.lean` | Existing count of primes ≤n. The real-argument source inequalities use Nat.primeCounting of the natural floor, without redefining π. |
| `mathlib:Nat.exists_prime_lt_and_le_two_mul` | `Mathlib/NumberTheory/Bertrand.lean` | At the Mathlib pin, for n:ℕ and n≠0, gives a prime q with n<q≤2*n. This supplies the intervening prime in the no-consecutive-Fermat argument; no new Bertrand theorem is planned. |

## Paper routes and proposed dependency changes

**PAPER-BREUIL-CONRAD-DIAMOND-ETAL-01/modular-galois-rep.** R26.1 states the consumed modular/strong-modular contract; R15.6/R19.1 own the notions, R20.6 owns the residual refinement (ℓ≥3). No second representation or conductor definition.

**PAPER-KHARE-WINTENBERGER-09-I/E4.** The §7/§8.2 r reuse is recorded here as E10. E1,E2,E3,E6 concern R27.3–R27.6 and are retained in the sibling packet; E5’s nilpotent WD matrix correction belongs to R24 and is consumed there.

**Problem.** RT-AREA-langlands-2/1: current R27.1 has an inherited R26.6 requirement, defeating the early good-dihedral prefix used by R33. The stage graph cannot erase the edge by adding a link. RT-AREA-langlands-2/7 also requires an integral Savitt supplier at R07.5 and its compatible-system consumer edge.

**Proposed application.** Replace R27.1 by R27.1a (Definition2.1, Lemma6.3, Lemma8.2) and R27.1b (good-dihedral insertion and other late operations). R27.1a requires only R01.4/R01.5, R15.4, R24.5’s compatible-system operations or R24.6 residual-member interface, and Tau Ceti Chebotarev Layer10; delete inherited R26.6 and other late modularity requirements from this prefix. Preserve stable node ids and migrate the sibling R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes to R27.1a; its prime-field hypothesis remains. Migrate R27.1/good-dihedral-prime-insertion to R27.1b, with its actual R24 lift dependencies. Keep R26.6→R27.3 for W1. Replace RS-06 links R27.1→R33.2/R33.3/R33.6 by R27.1a→those stages; assign any actual late insertion consumers to R27.1b explicitly. The mixed Dickson/modularity/weight alias keeps its RS-06 component owners, not a new early-prefix dependency. Add the weight-classification dependency R07.5→R24.6 (R07.4 descent precedes R07.5); remove R15.4-as-integral-classification ownership. After application check that no R26.x stage is an ancestor of R33.1–R33.5. Do not create fictitious live stage ids in this packet.

**Packet supplier edges.**

- `ClassicalSerreModularity:R26.3` → `ClassicalSerreModularity:R27.2`: Single owner of shared odd auxiliary-prime estimate; R27.2 retains dyadic exponent selection and characteristic induction.
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5` → `ClassicalSerreModularity:R26.4`: Savitt/Breuil–Mézard ordinary tame potentially BT classification.
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5` → `ClassicalSerreModularity:R27.2`: Savitt Cor6.15 residual weights in KW Theorem5.1(3),(4).

**Stage-graph check.** For this revision, a scratch simulation starts from all Atlas stage prerequisites plus the accepted RS-06 links, replaces the R27.1→R33.2/R33.3/R33.6 edges with the proposed early prefix, assigns only the early suppliers specified above, and adds R07.5→R24.6. Before that change R33.2–R33.5 inherit R26.6 through R27.1. In the proposed graph R33.1–R33.5 have no R26.x ancestor. This is a check of a proposal, not a modification of the live Atlas; the maintainer must apply it and repeat the check. Chebotarev Layer 10 is an upstream dependency outside the Atlas stage graph.

## Coverage and remaining boundaries

Packet status is `complete`: this planning pass covers all eight scoped stages. Every stage remains `planned`, with no closure or implementation claim. The six gaps below remain obligations for suppliers, source follow-up or restructuring.

**ClassicalSerreModularity:R26.1.** `planned`. All stated stage targets have node-level plans or exact sibling-node imports. Requests and source boundaries prevent a closure claim.

**Remaining.**

- Resolve the Duke-numbered Theorems5.1/6.1 in KW’s corrected Corollary8.1 references; discharge modular/strong-modular supplier contracts.

**ClassicalSerreModularity:R26.2.** `planned`. All stated stage targets have node-level plans or exact sibling-node imports. Requests and source boundaries prevent a closure claim.

**Remaining.**

- Verify the remaining local/global lifting supplier contracts, including the precisely checked R07.5 BM/Savitt inputs, ordinary weight-two eigenform realisation, and canonical compatible-system APIs.

**ClassicalSerreModularity:R26.3.** `planned`. All stated stage targets have node-level plans or exact sibling-node imports. Shared odd estimate has one owner; the false uniform Chebyshev π bound is recorded and replaced.

**Remaining.**

- Close the explicit-prime-counting proof boundary at Rosser–Schoenfeld’s analytic/finite verification arguments; independently verify E11 against the Duke edition.

**ClassicalSerreModularity:R26.4.** `planned`. All stated stage targets have node-level plans or exact sibling-node imports. Requests and source boundaries prevent a closure claim.

**Remaining.**

- Discharge the precise nonordinary/ordinary lifting contracts and Skinner’s unpublished CM-dihedral correction E11 of the R21 supplier. Supply the general crystalline weight-k system and its normalized residual weights for Corollary 5.5, with cyclotomic restriction checked before invoking the R24 lift.

**ClassicalSerreModularity:R26.5.** `planned`. All stated stage targets have node-level plans or exact sibling-node imports. Five terminal rows and all degeneracy branches are explicit.

**Remaining.**

- Discharge the imported lifting/base-case contracts for each of the five fully stated terminal rows; no row decomposition remains missing.

**ClassicalSerreModularity:R26.6.** `planned`. All stated stage targets have node-level plans or exact sibling-node imports. Requests and source boundaries prevent a closure claim.

**Remaining.**

- Resolve published-numbering and ordinary CM correction boundaries; discharge integral Hecke/abelian character finiteness and optimisation contracts.

**ClassicalSerreModularity:R27.1.** `planned`. All stated stage targets have node-level plans or exact sibling-node imports. Chebotarev choice and insertion remain uniquely owned by the stable R27.1 nodes in ClassicalSerreModularity--R27.3; no duplicates are introduced.

**Remaining.**

- Apply the explicit stage split/base-edge deletion and reconcile the sibling Chebotarev/insertion nodes; discharge canonical conductor/API and component-owner requests.

**ClassicalSerreModularity:R27.2.** `planned`. All stated stage targets have node-level plans or exact sibling-node imports. The final reduction to the predecessor characteristic is explicit; r and e are distinct.

**Remaining.**

- Discharge R07.5 local weight and R24/R22 lifting contracts; supply canonical HypL/HypW/HypD signatures when the genuine residual modularity interface exists.

### Edition discrepancy in the level-one source

Verified: arXiv:math/0504080v1 (5 April 2005) is titled 'On Serre's modularity conjecture for 2-dimensional mod p representations of Gal(Qbar/Q) unramified outside p'. It was published as 'Serre's modularity conjecture: the level one case', Duke Math. J. 134 (2006), 557-589. Not verified: whether the numbering of results is the same in the two versions; all locators in this packet are to the preprint. Next source action: if Duke pagination is required downstream, obtain the published version and re-map Theorem 1.1, Corollaries 1.2, 1.3 and Propositions 2.1, 2.2.

**Affected declarations.**

- `ClassicalSerreModularity:R26.1/level-one-theorem-and-the-meaning-of-arises-from`
- `ClassicalSerreModularity:R26.1/corollary-1-2-conductor-a-prime-and-its-corrected-proof`

### KW I's corrected references to Khare's level-one paper use numbering absent from the arXiv preprint

Verified (reviewer): KW I's bibliography gives [24] = Khare, 'Serre's modularity conjecture: the level one case', Duke Math. J. 134 (2006); the proof of Corollary 8.1(i) cites '3 of Theorem 5.1 of [24]' (as insufficient) and '(2) of Theorem 6.1 of [24]' (as the correct input), and 1.2 relates KW I Theorems 4.1 and 5.1 to Theorems 6.1 and 5.1 of [24]. The copy read, arXiv:math/0504080v1, has no Theorem 5.1 or 6.1 (its compatible-system result is Proposition 3.1 and its section 6 is the proof of Theorem 1.1). The drafter's reading 'Theorem 6.1(2) of the Annals paper' confused [24] with [22]. Next source action: obtain the published Duke version of Khare's paper and locate Theorems 5.1 and 6.1.

**Affected declarations.**

- `ClassicalSerreModularity:R26.1/corollary-1-2-conductor-a-prime-and-its-corrected-proof`

### Skinner's correction to Skinner–Wiles 2001 (KW I's [41]) is unpublished

Verified: KW I (preprint pp. 3 and 16) augment their Skinner–Wiles references [39] (1999) and [40] (2001) by [41] = C. Skinner, 'Nearly ordinary deformations of residually dihedral representations' ('to appear'), 'which is a correction to [40]'; Allen (arXiv:1301.1113) lists it as a 2009 preprint. It was not obtained. It bears on the residually dihedral branches of Khare's argument (ρ̄ induced from ℚ(√((−1)^{(p−1)/2}p))), which OrdinaryAutomorphicFormsAndModularityLifting R21.5 plans with the dihedral CM case excluded (its source issue E11). For p ≡ 1 mod 4 the field is real and the plan applies; for p ≡ 3 mod 4 the branch waits on E11.

**Affected declarations.**

- `ClassicalSerreModularity:R26.4/level-one-lifting-lemma`
- `ClassicalSerreModularity:R26.4/degenerate-branches`
- `ClassicalSerreModularity:R26.6/corollary-1-2-proof`
- `ClassicalSerreModularity:R26.1/corollary-1-2-conductor-a-prime-and-its-corrected-proof`

### Explicit prime-counting proof and omitted integral-classification calculations

Read Rosser–Schoenfeld p.69 exact statements, not its analytic proof or finite verification tables; a formal proof must cover both. Independently checked the resulting finite auxiliary-prime applications for all 2,422 primes 5≤p≤21591, with largest selected P=21599. Breuil–Mézard §6.1 Proposition 6.1.1 has now been obtained and read with its odd-prime, nonscalar type, HT {0,1} and arbitrary-lattice hypotheses. Its introduction to §6 omits computation details; R07.5 must supply those integral proofs, alongside the read Savitt v3 Theorem 6.11/Corollary 6.15/Remark 6.17. The earlier source-access gap is resolved, not the integral supplier proof obligation.

**Affected declarations.**

- `ClassicalSerreModularity:R26.3/explicit-prime-counting-input`
- `ClassicalSerreModularity:R26.4/local-reducibility-ordinary`

### Canonical suggested Lean interfaces absent at the pin

Pinned libraries contain matrix GL2 and cusp-form carriers but not the assembled residual G_Q representation with actual Artin conductor, classical Serre weight and attached-newform residual modularity witness. Suggested Lean states the full good-dihedral matrix predicate with explicitly supplied inertia and conductor parameters and its expressible API/tests, and the arithmetic theorem signatures. Canonical specialization, q²-conductor theorem, HypL/HypW/HypD and representation-valued headline signatures are omitted with a name-by-name ledger; never replace these missing objects with arbitrary proposition fields.

**Affected declarations.**

- `ClassicalSerreModularity:R27.1/good-dihedral-prime-definition`
- `ClassicalSerreModularity:R27.2/hypotheses-Lr-Wr-and-Dr`
- `ClassicalSerreModularity:R26.1/level-one-theorem-and-the-meaning-of-arises-from`
- `ClassicalSerreModularity:R27.2/theorem-3-2-weight-reduction`

### Stage-graph split requires maintainer application

Current R27.1 inherits R26.6, so node-level early-prefix independence does not remove the stage path to R33.2–R33.5. The packet’s explicit R27.1a/R27.1b rescope proposal must replace the base requires and RS-06 source endpoints; adding links alone cannot fix it. The Chebotarev/insertion nodes are preserved in the sibling R27.3 packet. Verify no R26.x ancestor of R33.1–R33.5 after application; until then this structural target is planned, not closed.

**Affected declarations.**

- `ClassicalSerreModularity:R27.1/good-dihedral-prime-definition`
- `ClassicalSerreModularity:R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved`
