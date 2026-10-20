# ArithmeticKTheory package: independent adversarial review

Reviewer: `independent-review-REV-PKG-ArithmeticKTheory~adv`  
Agent: Codex, session `codex-gxwhL8`  
Issue: #11242  
Date: 2026-10-20  
Verdict: **needs_changes**

The package preserves the effective assembly's number-field targets and its
careful distinctions between ordinary, positive, cohomological and raw local
K-theory. I corrected the defects that could be resolved here. The remaining
obstacle is mathematical proof closure: in particular the uniform
annihilating-modulus assertion in §6.6 lacks the argument claimed for it.
The exceptional dyadic image argument and several original-source map inputs
also remain unverified. A successful Lean elaboration does not resolve these
issues.

This report is also the handoff required by WORKERS.md. Only the package and
this report were edited; the packets and other roadmaps were not changed.

## Corrections applied

1. **Coefficient kernels (§6.6).** Named the unconditional identification
   `coefficientKernel_eq_inter_mul`, gave the finite-set argument for
   `coefficientKernel_eventually_eq_div`, and retained the stronger
   `coefficientKernel_eq_div_of_annihilates` as an explicit proof gap. Added
   the finite-group counterexample and an arbitrarily late stabilization
   family. No arithmetic target was weakened or discarded.
2. **Cyclotomic descent (§6.11).** Replaced the unspecified H² hypothesis
   with the actual corestriction isomorphism `cyclotomicH2Descent`, its
   ordinary cohomological-dimension-two range, and the named coinvariant
   sequence. Named the positive H² counterpart and its sequence separately.
   The ordinary assertion includes odd primes with real places; ordinary
   dyadic descent over a real base is excluded. Added identity, nonzero H₁
   and real-place checks.
3. **Definition tests.** Converted all 31 remaining inline Checks paragraphs
   to bullet lists, preserving their computations and restrictions. Replaced
   the twisted-norm paragraph's concluding observation by an actual
   non-coprime negative control. Made the zero-input Bernoulli value,
   truncated-subtraction failure and totalized regularity predicate explicit.
4. **Lean witnesses.** Extended existing examples for `divisibleSubgroup`,
   `evenTwoRank` and `bernoulliTop`; added one proved example for
   `IsRegularPrime` at 0 and 1. Every kept definition now has a proved
   discriminating example, with at most two per definition. Extended the
   closing comment to cover the newly named descent maps and Tate filtration
   definitions. No heavy carrier or admitted example was introduced.
5. **Bibliography.** Corrected the first author of the symplectic K-theory
   paper to Tony Feng and its article range to pp. 225–319, as printed on
   the published article. `metadata.toml` already has the correct topic and
   needed no change.

## Remaining proof requirements and where to resume

### U1. An annihilator is not a stabilization bound

Put A=K_n(F), T=K_n(O_(F,S)), n positive even, and mT=0.
The universal-coefficient diagram and integral odd-degree injectivity give
the kernel T∩mA. Finiteness of T proves eventual equality to div A:
for each x in T outside div A choose a positive modulus excluding x,
then take their least common multiple together with an annihilator of T.
Every multiple of the resulting modulus works.

The stronger assertion for **every** annihilator m is stated in Weibel's
combined K-book, V.6.8.2, printed p. 413. The proof in the cited wild-kernel
preprint's Corollary 4.6, p. 13, establishes eventual stabilization, but
does not establish that its earlier m₀ is a sufficient bound. In the group
A=ℤ/4 with T=2A, 2T=0 while T∩2A=T and div A=0. More generally,
A=ℤ/2^r and T=2^(r−1)A keep |T|=2 and allow arbitrarily late drops.
These are counterexamples to the proposed general-group inference, **not**
counterexamples to the arithmetic assertion.

Resume at README §6.6. Find an arithmetic theorem proving the uniform
bound, or prove it from additional arithmetic structure. Keep the strong
target until it is proved or an arithmetic counterexample settles its scope.
Do not claim that the eventual theorem proves the strong one.

### U2. Exceptional odd dyadic Picard images

The package already identified this problem; independent reading confirms
that it remains. The author preprint's Lemma 4.4, p. 12, independently
prescribes ideal class and norm residue. For ℚ(i), a prime ideal of odd norm
has norm 1 modulo 4: split primes have that rational norm, and inert primes
have squared norm. The requested residue 3 modulo 4 is therefore impossible.
Consequently that unrestricted lemma does not close the exceptional odd
branch of Theorem 4.5, or its later real adaptation. This finding concerns
the dated author preprint; the published version was not collated, and the
main arithmetic conclusions have not been refuted here.

Resume at §§6.11–6.12: supply the compatible class/norm prescription with
its exact compatibility subgroup, or an independent Picard-image proof.
Retain the odd-primary, even-twist and independently justified
nonexceptional branches. Retain special-field and real-place obstruction
terms. A conditional restatement of the desired image theorem does not
close its proof.

### U3. Original maps and cyclotomic proof inputs

- **Harris–Segal (§5.5):** K-book VI.2.5 and its proof, p. 473, and the
  Handbook survey's odd-torsion discussion, pp. 167–169, were read.
  They support the reported summand theorem. The original Harris–Segal §3
  proof was not obtained; the publication page supplies bibliographic data,
  not the finite-field/wreath-product construction and its functorial map.
  The required detected-map supplier remains open.
- **Keune (§6.13):** Calegari–Garoufalidis–Zagier v3, Lemma 3.5 and proof,
  p. 20, were read. Its injection is a cited Keune input rather than a proof
  of that original map. Keune's original theorem and its exact hypotheses
  and twist normalization were not obtained. The finite-module implication
  about vanishing of invariants and coinvariants is not a canonical
  identification of those functors. Verify the original injection before
  marking this boundary closed.
- **Regular primes (§§7.1–7.5):** the finite criteria and consequences are
  correctly separated from congruences, the Iwasawa tower theorem,
  reflection, Vandiver and the special-value order formula. K-book VI.2.4.1
  and VI.10.5 were checked. The original Kummer/Herbrand–Ribet and tower
  proofs and the full regular-prime coefficient-module construction were
  not independently verified in this review. Washington is not listed as
  cleared in the library index; no other copy was used. Preserve the exact
  IntegralIwasawaTheory and coefficient supplier requests.

### Other inherited boundaries

The assembly's nine gaps remain visible rather than being silently treated
as supplied theorems. The connected H-space result is mathematically
supported by Serre (III §1 Proposition 1, pp. 465–466; IV §3 Proposition 3,
p. 479; IV §6 Proposition 9, p. 483; V §§1–2, pp. 489–491, including the
simple-space variant). It still needs the stated connected H.3 export;
a simply connected theorem cannot be applied directly to BQ. The hermitian
Witt-signature and finite-type orbit exports, K.7 coefficient maps, early M.7
edges, real KO maps and Brauer calculation remain explicit supplier contracts.
Their arithmetic conclusions are not consequences of merely having the
corresponding object types.

The raw-versus-symbol comparison in higher even degree is properly
conditional on actual global-to-local vanishing and real detection. A finite
torsion group can map nontrivially to a divisible torsion group, so that
boundary was not deleted. The package itself avoids the old M.8 Chern-family
cycle by using M.7's early edge. Applying the documented boundary changes in
other packets remains outside this issue's permitted edits.

## Sources opened and checked

The K-book checked here is the combined author PDF dated 29 August 2013,
SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`.
The wild-kernel text is the author preprint dated 23 July 2004,
SHA-256 `2675756fe4e03556dac1b26538eeca0fd1b8bf0ae7d800433a3c708812f3478b`.
Its poor text extraction was checked against rendered pages. All source
statements below are paraphrases; no source passage was added to the repository.

The locator sample was selected from the original README's parenthetical
K-book citations with a fixed pseudorandom seed of 11242, before editing.
All fifteen selected occurrences were opened, including the companion sources
named in those occurrences. The table records the actual locators, rather than
line numbers that changed while fixing the package.

| Sample | Locator opened | Result |
| --- | --- | --- |
| 1 | K-book Exercise VI.8.3.1, p. 514 | Even-primary arithmetic example has the stated range. |
| 2 | V.6.6, p. 409; V.6.8, pp. 412–413 | Localization and parity support the stated even injectivity. |
| 3 | V.6.6.3–6.6.4, p. 410 | Residue transfer uses residue degree; restriction needs ramification multiplicity. |
| 4 | V.6.1, p. 406; VI.9.4, p. 519 | Finite-extension ring and arithmetic injectivity uses are distinguished. |
| 5 | VI.8.2–8.3, pp. 513–514 | Imaginary integral structure and odd torsion agree. |
| 6 | Proposition VI.2.3, pp. 471–472 | Dyadic formula requires the exceptional/nonexceptional cases. |
| 7 | Exercise VI.8.3.2, p. 514; Proposition VI.10.5, pp. 530–531 | Regular-prime module is a separate theorem, not a formal coefficient construction. |
| 8 | V.6.8.2, p. 413; wild-kernel Definition 0.2, pp. 2–3 | Raw completion and finite-symbol kernels must be distinguished. |
| 9 | Rognes–Weibel §1 after Example 1.6, p. 8; K-book VI.1.6–1.7.1, pp. 467–468; VI.8.2–8.3, pp. 513–514 | Early edge is compatible with the Bockstein/colimit route; no full Chern family is needed. |
| 10 | Kahn §4.1, p. 15; Definition 2.3.2, p. 10; K-book IV.6.8–6.9, p. 325 | Full rank subcategories and cellular direction agree. |
| 11 | VI.2 after Example 2.2.2 and Proposition 2.3, p. 471 | Cyclicity definition, rather than real places alone, determines exceptionality. |
| 12 | Example VI.2.1.2, p. 470; Example VI.2.4, p. 472 | Rational small w-values and cyclotomic exponent convention agree. |
| 13 | Corollary VI.9.9, pp. 522–523 | Positive even two-ranks agree, with real and dyadic assumptions. |
| 14 | III.5.2.2, p. 218; III.6.2.1, p. 232 | Presentation relations require a separate spanning/completeness argument. |
| 15 | Proposition VI.10.5, pp. 530–531 | Generator degrees and regular-prime range agree; Vandiver is separate. |

Additional source checks covered the flagged boundaries above, Quillen's
Theorem 3 and stability corollary (pp. 181–182) and finite-generation proof
(pp. 184–185), Serre's cited propositions and variants, the wild-kernel
preprint's Corollary 2.3 (p. 7), §§4–6 (pp. 11–16), and
Calegari–Garoufalidis–Zagier's Lemma 3.5 (p. 20).
Calmès et al. v4 Corollaries 2.3.16, 2.3.18 and 2.3.19 and proofs
(pp. 47–48) support the L/GW ranges, with characteristic zero essential.
Feng–Galatius–Venkatesh's published Proposition 2.9, Lemma 2.10,
Lemmas 2.11/2.14 and Corollary 2.12 (pp. 242–247) support all integer
Bott degrees and the separate ordinary degree-one statement.
Bass–Tate's II Lemma 3.4, Claim 2 (pp. 410–411) and Appendix Proposition 1
(pp. 430–431) were read, as were Groenewegen's Lemmas 6, 9, 12,
Propositions 10, 13 and Theorem 14 (pp. 1447–1454).

Two existing source corrections were retained: w₁₀(ℚ)=264, computed from
B₁₀/20=1/264, and a real closed field is nonexceptional under the given
cyclotomic cyclicity definition. The source's contradictory examples are not
imported into the roadmap.

## Libraries, ownership and prerequisites

Read the reviewed library-coverage entries for N.1–N.8, the accepted assembly
and its contract revisions, two atlas upstream examples, the approved
PadicMeasuresIwasawaAlgebras exemplar, and current upstream examples.
The effective inventory is 130 inherited targets after contract revisions
plus nine assembly targets: 139 total, of which 136 are in scope and three
are explicitly deferred function-field targets.

Checked Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and the actual
Tau Ceti declarations at `f790474821cf4256814db967cb154e7af3d0c369`.
Read, among others, `Set.integer`, `Set.unit`, `unitEquivUnitsInteger`,
`integer_empty`, `integer_univ`, `NumberField.classNumber`,
`classNumber_ne_zero`, `bernoulli`, `bernoulli_one`,
`bernoulli_eq_bernoulli'_of_ne_one`,
`AddCommGroup.equiv_free_prod_directSum_zmod`,
`integer_extendedHom_surjective`, `ker_integer_extendedHom`,
`integerClassGroupEquiv`, `finite_integer_classGroup`,
`Set.unitValuation_ker` and `Set.unit_fg_of_units`.
In particular the class-group quotient already exists and the unit
finite-generation instance does not supply an S-unit rank theorem.

Object searches also covered current TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including the nine newer
roadmaps and the four named Completed roadmaps. Searches used rank
subcategories, relative homology, exact-category K₀, multiplication images,
finite-coefficient operations, twists, cyclotomic action, lattices, units and
quadratic-field invariants as well as names. The nearby local cyclotomic
character, profinite arithmetic, quadratic-form and lattice targets have
different domains or are already deferred by this package. The current
golden-field arithmetic declarations in `WorkedExamples.Sqrt5` were read and
are already correctly listed as suppliers. No additional duplicate target was
found or removed. The current checkouts were only read.

No upward proof dependency or `FoundationsAndLibraryIntegration`/`UPSTREAM:`
placeholder remains in this package. Downstream consumers and the separately
conditional special-value calculation are not prerequisites of the golden
certificate. Bibliographic citations to suppliers are not claims that their
requested new exports are already formalized.

## Adversarial statement pass

In the table, IDs omit the common prefix `ArithmeticKTheory:`. Each row
covers the effective target and its associated API in the cited README
section: domains, identity/composition laws, membership, exactness,
functoriality and the specified comparison map. “Retained” means no defect
was found in those instances, subject to the explicit supplier contracts;
it does not certify an unread original proof. U1–U3 refer to the open proof
requirements above. The three function-field entries record the scope
decision explicitly. Every effective target occurs exactly once.

| Effective target | README | Instances computed / boundary tried | Result and change |
| --- | --- | --- | --- |
| `N.1/S-integers-as-a-localisation` | 1.1 | S empty/full; R a field; ℤ[1/p]; a nonprincipal prime of ℚ(√−5). | Retained both denominator conditions; no principal-prime assumption. |
| `N.1/K1-of-S-integers-and-the-determinant` | 1.3 | K₁(ℤ)=±1; ℤ[1/p] has rank-one units. | Determinant/SK₁ supplier retained; no Borel-rank claim at degree one. |
| `N.1/norms-transfers-and-pullbacks` | 1.3 | Identity extension; free quadratic algebra; nontrivial Steinitz class. | Transfer retains determinant correction c_B^r. |
| `N.1/S-integers-localisation-of-torsion-class-group` | 1.1 | Infinite S; finite class group; torsion class of a nonprincipal prime. | Positive power makes a denominator; finiteness of S is unnecessary. |
| `N.1/S-integers-monotone` | 1.2 | S empty; S=T; S all primes. | Inclusion goes from smaller to larger S; identities/composites retained. |
| `N.1/S-integers-in-a-finite-extension` | 1.2 | ℚ⊂ℚ(i), S={(2)}; one extra upper prime over 5. | Full inverse-image prime set required for finite projectivity. |
| `N.1/transfer-and-norm-on-units` | 1.3 | Quadratic norm of −1; identity extension. | Norm/pullback composite is x↦x^[E:F], not the identity. |
| `N.2/localisation-sequence-for-a-dedekind-domain` | 2.1 | Field; DVR; ℤ→ℤ[1/p]. | Empty, singleton and relative prime indexing distinguish the cases. |
| `N.2/finite-support` | 2.1 | One residue coordinate versus infinitely many nonzero coordinates. | Boundary lies in the direct sum; infinite tuples excluded. |
| `N.2/the-three-classical-rows` | 2.2 | At ℤ_(5), β{5,2}=2 and β{2,5}=3. | Boundary and inverse tame-symbol convention retained. |
| `N.2/localisation-sequence-and-finite-extensions` | 2.3 | Unramified residue extension; totally ramified degree two; split prime. | Transfer and restriction squares use their respective maps. |
| `N.2/S-unit-and-class-group-sequence` | 2.2 | S empty; valuation of p is 1; nonprincipal divisor. | K₀ divisor map uses inverse ideal class; signs retained. |
| `N.2/even-degree-injectivity` | 2.4 | n=2; field with no primes; finite-field even K=0. | Positive-even injectivity retained; n=0 is a separate row. |
| `N.3:finite-generation/finite-generation-of-K-of-S-integers` | 3.3–3.4 | S empty and singleton; K₁ unit rank changes. | Finite generation for finite S; same ranks only for n≥2. |
| `N.3:finite-generation/rank-filtration` | 3.1 | Rank zero object; rank one nonfree projective. | Full rank-bounded Q-subcategories, not a free-module skeleton. |
| `N.3:finite-generation/layer-poset` | 3.1 | dim V=0/1; two proper layers in rank one; 𝔽₂² gives eleven. | Excludes (0,V); interval order and direction retained. |
| `N.3:finite-generation/comma-category-is-the-layer-poset` | 3.1 | Zero-rank lower category; identity subquotient; rank-one comma objects. | Specified comma functor uses both subspaces covariantly under isomorphisms. |
| `N.3:finite-generation/layer-poset-is-the-suspended-building` | 3.2 | Rank one: reduced H₀ of two points is ℤ. | Unreduced suspension convention fixes St₁ and its trivial action. |
| `N.3:finite-generation/rank-spectral-sequence` | 3.2 | p=0 column; i<m; diagonal p+q=i. | Only ℤ at (0,0); negative relative indices are zero. |
| `N.3:finite-generation/quillen-finiteness-criterion` | 3.2 | Infinite Picard group; finite Picard with nonfree classes. | Both finiteness hypotheses remain; all projective classes counted. |
| `N.3:finite-generation/steinberg-homology-of-automorphism-groups` | 3.2 | Rank one; nonfree lattice; orientation character of arithmetic group. | Imported from BorelRegulators R.1; untwisted duality not substituted. |
| `N.3:finite-generation/quillen-finite-generation-theorem` | 3.2 | n=0/1; π₁(BQ)=K₀; connected H-space. | Connected finite-type theorem required; simply connected input insufficient. |
| `N.3:ranks/borel-rank-theorem` | 3.4 | ℚ at n=2,3,5; imaginary quadratic at n=3,5. | Ranks 0,0,1 and 1,1; numerical totalization has separate range. |
| `N.3:ranks/even-K-groups-of-S-integers-are-finite` | 3.4 | K₂(ℤ)=ℤ/2; n=0 and n=1 excluded. | Finite generation plus rank zero used, not rank zero alone. |
| `N.3:ranks/even-K-groups-of-the-field-are-infinite-torsion` | 3.4 | K₂(ℚ); residue 𝔽₂ term trivial but infinitely many others nontrivial. | Infinite torsion retained; field finiteness not inferred from ring finiteness. |
| `N.3/finiteness-and-ranks-combined` | 3.4 | Finite S versus all primes; even/odd positive degrees. | Combined theorem preserves each range and degree-one exception. |
| `N.4/the-w-invariant` | 4.1 | Trivial twist; real/complex fields; negative twists by duals. | W₀ may be infinite; no ordinary tensor-power definition. |
| `N.4/computing-w-from-the-cyclotomic-character` | 4.2 | ℓ=3, weights 1,2,6; character image order 2. | Orders 1,3,9 distinguish valuation and residue-order conditions. |
| `N.4/exceptional-fields-at-two` | 4.3 | ℚ; ℚ(i); ℚ(√−7); ℚ(√−2); real closed field. | Cyclicity, not presence of real places, defines exceptionality. |
| `N.4/w2-of-the-rationals-and-the-divisibility-tests` | 4.4 | w₂=24; w₄=240; w₁₀=264. | Existing corrected weight-ten value retained. |
| `N.4/exponent-criterion` | 4.2 | Weight zero; finite character image; unbounded roots. | Exponent criterion valid; finiteness formula excludes zero weight. |
| `N.4/finiteness-of-the-w-invariant` | 4.1–4.2 | Number field, nonzero twist; zero twist has all trivial coefficients. | Finite cyclic result retains nonzero-twist hypothesis. |
| `N.4/two-primary-w-invariant` | 4.3 | Odd/even weights; exceptional and procyclic dyadic images. | Minimum/cyclic-image branches retained; odd-prime formula not reused. |
| `N.5/totally-imaginary-integral-structure` | 5.3 | Imaginary quadratic at n=0,1,3; finite S enlarged. | Positive odd rank r₂; K₁ has its own S-unit rank. |
| `N.5/the-real-case-modulo-eight` | 5.4 | ℚ at n=3/5; r₁=1/2; odd-degree residues modulo 8. | ℤ/48 and torsion-free rank one distinguish the real rows. |
| `N.5/soule-theorem` | 5.1 | n=1 excluded; n=3; residue norm 2. | Odd integral maps are isomorphisms only in degree ≥3. |
| `N.5/soule-mod-l-surjectivity` | 5.1 | Moduli 2,3 and a safe larger modulus. | Reduction/connecting maps required; no arbitrary coefficient ring product. |
| `N.5/e-invariant` | 5.2 | ℚ, i=2, ℓ=2 versus odd ℓ; Bockstein degree shift. | Actual torsion edge, not an unspecified isomorphism; kernel retained. |
| `N.5/harris-segal-summand` | 5.5 | Odd ℓ over ℚ; real dyadic field; imaginary exceptional field. | Correct scope; original detected-map construction remains U3. |
| `N.5/odd-torsion-at-a-prime-where-cd-is-two` | 5.2–5.3 | Exceptional imaginary ℚ(√−7), ℓ=2; real ℚ excluded. | Cohomological dimension controls edge isomorphism, not nonexceptionality. |
| `N.6/even-groups-at-odd-primes` | 6.1 | ℚ at odd ℓ; one inverted ℓ-place; zero class-group rank. | Rank t+s−1 and twist i+1 retained. |
| `N.6/the-two-primary-corrections` | 6.3 | ℚ(√2) versus ℚ(√7); r₁=1. | ρ is not a signature-only invariant; hidden kernel retained. |
| `N.6/tame-and-wild-kernels` | 6.7 | ℚ sign class; Gaussian zero tame kernel; higher local divisible part. | Raw, tame and symbol kernels remain distinct. |
| `N.6/order-certificate` | 6.14 | Empty presentation; ℤ/4↠ℤ/2; matching finite lower quotient. | Relations/spanning alone do not prove the order; two bounds required. |
| `N.6/certificate-driven-computation` | 8.1 | Empty generator list; valid quotient without full kernel proof. | Certified evidence requires mathematical relation and surjectivity fields. |
| `N.6/even-groups-of-a-totally-imaginary-field` | 6.1 | Gaussian dyadic class group zero and one dyadic prime. | Positive even Gaussian groups have odd order, not asserted zero. |
| `N.6/even-groups-modulo-l` | 6.1 | Mod-ℓ UCT with nonzero odd torsion; ℓ=2 real case excluded. | Integral quotient and coefficient group not conflated. |
| `N.6/l-rank-from-class-group-data` | 6.1 | s=1,t=0; ℓ and ℓ² cyclic factors. | Rank zero in first case; equal ranks do not imply equal orders. |
| `N.6/signature-defect` | 6.2 | One real place; two fields with equal signature and different Selmer signs. | Uses Selmer classes and u−t; units alone do not determine defect. |
| `N.6/order-ratio-for-totally-real-fields` | 6.5 | ℚ at i=2 and 4; i=0/odd excluded. | Ratios 1/12 and 1/120; factor 2^r₁ and zero-group order one retained. |
| `N.6/divisible-subgroup` | 6.6 | ℚ, ℤ, ℤ/4, ℚ/ℤ; incompatible-root counterexample. | Ambient divisibility retained; new Z/4 Lean control. |
| `N.6/divisible-subgroup-and-the-wild-kernel` | 6.12 | Special imaginary field in odd weight; raw local divisible quotient. | Symbol theorem and raw-completion condition separated; U2 retained. |
| `N.3:finite-generation/function-field-steinberg-finiteness` | Scope | Function field and arithmetic-lattice hypotheses differ. | Explicitly out of scope; no number-field-only proof assigned to it. |
| `N.3:finite-generation/affine-curve-finite-generation` | Scope | Affine curve over finite field versus number-ring S-integers. | Explicitly out of scope; not silently omitted from inventory. |
| `N.3:finite-generation/proper-curve-finite-generation` | Scope | Proper curve versus affine curve. | Explicitly out of scope; no unproved proper-curve reduction added. |
| `N.6/keune-cyclotomic-picard-injection` | 6.13 | p=2; ramified p; p-unit valuation; invariants/coinvariants. | Hypotheses and twist retained; original injection remains U3. |
| `N.2/ramified-residue-pullback` | 2.3 | e=2, residue identity; two primes of e=1. | Restriction multiplies each upper residue coordinate by its own e. |
| `N.2/ramification-weighted-devissage` | 2.3 | Totally ramified quadratic extension; associated graded residue filtration. | Length e, not residue degree f, supplies multiplicity. |
| `N.2/finite-extension-restriction-compatibility` | 2.3 | Identity, composition and split prime. | Scalar extension on actual residue modules; summed factors not guessed. |
| `N.2/low-degree-ramified-restriction` | 2.3 | Valuation of uniformizer under e=2; residue-unit square. | K₀/K₁ boundary square agrees with the chosen β convention. |
| `N.2/s-integer-restriction-compatibility` | 2.3 | T exactly above S; mismatched upper prime set. | Finite-projective restriction compatibility keeps the prime-set hypothesis. |
| `N.3:finite-generation/relative-rank-homology-comparison` | 3.2 | m=1,i=1; m=2,i=2; i<m. | Relative term is Steinberg homology in signed degree i−m. |
| `N.3:finite-generation/rank-homology-stability` | 3.2 | m=i and m=i+1; H₀ at rank zero. | Surjectivity then isomorphism bounds retained. |
| `N.3:finite-generation/rank-filtration-homology-finite-type` | 3.2 | Nonfree rank-one classes; infinite Picard group excluded. | Induction needs finite classes and integral Steinberg finiteness. |
| `N.3:finite-generation/quillen-homotopy-finite-type` | 3.2 | Connected BQ with nonzero π₁; ℚ versus finitely generated groups. | Serre simple-space route verified; requested H.3 export retained. |
| `N.3:finite-generation/s-localization-finite-defect` | 3.3 | n=1 versus n≥2; one finite residue term. | Positive residue groups finite; degree-zero residue term causes unit rank. |
| `N.3/finite-rank-Q-homology` | 3.2 | m=0/1; integral groups with finite rational dimension only. | Integral finite generation required, not merely rational dimension. |
| `N.3/rank-filtration-homology-stability` | 3.2 | m=i boundary and one later stage. | Matches row 63's bounds; shared proof, no stronger claim. |
| `N.3/stable-Q-homology-finite-type` | 3.2 | Filtered colimit at fixed degree i. | Stability supplies finite-type homology; arbitrary colimit finiteness not used. |
| `N.3/finite-S-localisation-defect` | 3.3 | S empty/singleton; n=2/3; n=1 excluded. | Kernel/cokernel finite in the intended positive higher range. |
| `N.3/canonical-rational-S-integer-equivalence` | 3.3 | S=T; S enlarged; finite torsion killed by tensor ℚ. | Equivalence packages actual rationalized localization map. |
| `N.3/canonical-rational-equivalence-map` | 3.3 | Identity and composite localizations. | Forward map and inverse characterize the same equivalence, not a chosen basis. |
| `N.3/rational-localisation-extension-transfer` | 3.3 | Identity extension; ramification at one residue; rationalized square. | Restriction/transfer naturality inherited from actual integral maps. |
| `N.5/primary-bockstein-localisation` | 5.2 | Torsion-coefficient degree 2i to integral degree 2i−1. | Bockstein orientation and localization compatibility retained. |
| `N.5/e-invariant-descent-edge` | 5.2 | ℚ dyadic n=3 and 5; exceptional imaginary field. | M.7 early edge needed before M.8; real kernel/cokernel not discarded. |
| `N.5/diagonal-extension-normal-form` | 5.4 | w=24,r=1; w=2,r=2; r=0 separate. | Groups ℤ/48 and ℤ/4⊕ℤ/2 detect diagonal extension. |
| `N.5/real-e-invariant-extension` | 5.4 | w=8,r=1/2; n modulo 8, not i modulo 8. | ℤ/16 and ℤ/16⊕ℤ/2 fix normal form and real boundary. |
| `N.5/e-invariant-kernel-cokernel` | 5.2–5.4 | ℚ n=3 kernel ℤ/2; n=5 cokernel ℤ/2. | Correct residue classes and actual edge map retained. |
| `N.5/edge-normalised-chern-torsion` | 5.2 | Factorial scaling on torsion; dyadic real example. | Normalized edge identified; arbitrary Chern scaling not substituted. |
| `N.6/arithmetic-mod-two-dimensions` | 6.4 | ℚ, s=1,t=0; two real places; dyadic S required. | Ordinary H¹/H² retain real terms and the −1 correction. |
| `N.6/modified-mod-two-dimensions` | 6.4 | j=0/1; same arithmetic data except signatures. | Modified H¹/H² differ from ordinary dimensions. |
| `N.6/mod-two-coefficient-orders` | 6.4 | Log order two: ℤ/4 versus (ℤ/2)²; n=0 excluded arithmetically. | Order formula retained; no asserted vector-space structure. |
| `N.6/even-two-rank-function` | 6.4 | Even residues; odd input; n=0; s=0/1. | New negative control proves why s≥1 is needed for increment theorem. |
| `N.6/even-two-ranks-from-arithmetic` | 6.4 | Real dyadic rational case; imaginary and n=0 excluded. | Arithmetic rank identification keeps all standing hypotheses. |
| `N.6/finite-coefficient-divisibility-kernel` | 6.6 | A=ℤ/4,T=2A,m=2. | U1: split unconditional kernel identity/eventual theorem from stronger open target. |
| `N.6/stabilisation-of-primary-kernels` | 6.6 | A=ℤ/2^r,T=2^(r−1)A; long repeated finite kernels. | Eventual stabilization valid; no bound from \|T\| alone. |
| `N.6/positive-even-k-subgroup` | 6.7 | i=1/2; no real places; real sign of {−1,−1}. | Select by i≡1 mod4; other degrees give the full group. |
| `N.6/local-symbol-family` | 6.7 | Twist i+1 versus local order w_i; finite support versus product. | Local finite quotient and actual restriction/transfer maps retained. |
| `N.6/symbol-wild-kernel` | 6.7 | Zero map; nonzero symbol; lift through kernel inclusion. | Membership and universal-property maps have the actual field-group domain. |
| `N.6/global-moore-sequence` | 6.8 | ℚ at i=1; no real places; odd primary part. | Positive domain, invariant-sum cokernel and finite support retained. |
| `N.6/primary-s-integer-moore-sequence` | 6.8 | One ℓ-place; missing ℓ-place; extra v with ℓ dividing q_v^i−1. | S must contain every ℓ-place; additional prime effects retained. |
| `N.6/orders-of-symbol-wild-kernels` | 6.8 | Trivial wild group; order-one factor; real correction. | Product of local orders divided by global order uses exactness. |
| `N.6/cohomological-wild-kernel` | 6.9 | All localization coordinates zero; inverse limit; real modification. | Actual strict cohomological kernel, not an unspecified group of same order. |
| `N.6/symbol-cohomological-comparison` | 6.9 | Real i=2 with nonzero ρ; imaginary case. | Hidden elementary kernel retained in symbol/cohomological comparison. |
| `N.6/special-number-fields` | 6.10 | ℚ versus ℚ(√−14); exceptional versus special. | Additional local condition retained; notions not equated. |
| `N.6/special-dyadic-decomposition` | 6.10 | Cyclic dyadic image and noncyclic global image. | Actual decomposition subgroup condition required, not real-place count. |
| `N.6/twisted-residue-norm-test` | 6.10 | m=4,q^i=3; m=8,q^i=3; non-coprime q=2. | Norms 0 and 4 distinguish failure/success; new excluded-action check. |
| `N.6/hilbert-local-norm-certification` | 6.11 | Real m=2: two negative entries; positive second entry. | Norm from ℂ fixes symbol direction; higher symbols not defined this way. |
| `N.6/cyclotomic-class-group-descent` | 6.11 | E=F; nonzero H₁(C₂,ℤ/4 with sign); real dyadic base. | Fixed unnamed descent; exact ordinary/positive corestriction maps and ranges. |
| `N.6/cyclotomic-divisible-image` | 6.11 | Nonexceptional/even branches; incompatible ℚ(i) norm residue 3 mod4. | Exceptional odd branch remains U2; sufficiently large modulus retained. |
| `N.6/imaginary-nonexceptional-comparison` | 6.12 | Totally imaginary nonexceptional; odd ℓ; even i. | Independent good branches retained without unrestricted prescription lemma. |
| `N.6/imaginary-special-obstruction` | 6.12 | Special ℚ(√−14), odd i; nonspecial ℚ. | Quotient ℤ/2 retained; no splitting inferred; U2 proof boundary. |
| `N.6/real-motivic-obstruction` | 6.12 | Real F, odd special weight; even weight real terms. | Motivic group used before K-comparison; U2 adaptation still required. |
| `N.6/hidden-real-k-classes-are-divisible` | 6.12 | Hidden K₄ class for ℚ(√7). | Ambient div may contain finite nondivisible subgroup; no compatible roots assumed. |
| `N.6/weibel-symbol-divisibility-theorem` | 6.12 | Special/nonspecial and real/imaginary branches. | Precise obstruction terms retained; full proof closure depends on U2. |
| `N.6/raw-and-symbol-kernel-boundary` | 6.12 | Nonzero map from finite ℤ/2 into divisible ℚ₂/ℤ₂. | Torsion alone gives no local vanishing; conditional raw comparison retained. |
| `N.6/arithmetic-evidence-for-certificates` | 6.14 | Surjection with too-large source; independent finite quotient. | Both order bounds required; Birch–Tate formula not a certificate premise. |
| `N.7/bernoulli-conventions` | 7.1 | B₁ signs; k=0,1,2,5,6; p=5,k=5 cancellation. | New zero value −1; divided-denominator theorem still requires Kummer input. |
| `N.7/w-invariant` | 7.1 | Weights 2,4,6,10 and odd 3. | Denominators 24,240,504,264; even-weight restriction retained. |
| `N.7/regular-prime` | 7.2 | Totalized p=0/1; prime 2/3; cyclotomic tower. | New proved 0/1 control; finite definition and tower theorem separated. |
| `N.7/kummer-criterion` | 7.2 | p=3 empty range; p=37,k=16; p=2 excluded. | Bounds 1…(p−3)/2 retained; original proof import U3. |
| `N.7/eigenspaces-and-herbrand-ribet` | 7.3 | ℓ=37,k=16 gives exponent 5 mod36; ℓ=3. | Inverse character convention pinned; integral projector denominator not allowed. |
| `N.7/residue-field-units-prime-to-l` | 7.4 | ℓ=2 residue group order 1; odd ℓ and residue degree. | Residue multiplicative order is prime to ℓ, including trivial case. |
| `N.7/tame-kernel-vanishing-at-a-regular-prime` | 7.4 | ℓ=3 and 5 regular; p=2 separated; ramified cyclotomic prime. | Odd-primary tame consequence retains its regularity proof input U3. |
| `N.7/regular-prime-torsion-consequences` | 7.4 | ℓ=3 degrees 0,3,1; ℓ=5 degrees 0,7,1,5. | Module generator count correct; no illicit coefficient ring at 3; U3. |
| `N.7/vandiver-separation` | 7.5 | a=0 gives K₂ and K₃; 8a+1 at a=0 excluded. | c_(2a+2) indexing and conditional Vandiver/cyclicity retained. |
| `N.8/certified-example-format` | 8.1 | Zero group; empty presentation; unsupported lower bound. | ArithmeticData/CertifiedExample keep proof fields and independent bounds. |
| `N.8/k-groups-of-the-integers` | 8.2 | K₀…K₄ of ℤ; K₁ versus higher rank table. | ℤ,ℤ/2,ℤ/2,ℤ/48,0; unconditional K₄ vanishing separate. |
| `N.8/tate-norm-filtration` | 8.3 | m=0; one new prime; tied norms; symbols with old-unit entries. | Filtration is an actual subgroup image; t is inverse to β. |
| `N.8/tate-criterion` | 8.4 | q=2; a=b; norm equality q²; m₀=0/positive. | Injectivity required; zero difference handled; strict small-norm bound retained. |
| `N.8/gaussian-tame-kernel-vanishes` | 8.5 | Gaussian norm-two prime; later q≥5; real sign class restriction. | Separate first step and Euclidean bounds yield zero tame kernel. |
| `N.8/gaussian-and-imaginary-quadratic` | 8.5 | K₂(ℤ[i])=0 but K₂(ℚ(i)) has residues. | Ring/field distinction and empty certificate are justified separately. |
| `N.8/s-integer-sequence-for-one-inverted-prime` | 8.2 | p=2 and 3; n=1 and 3. | K₂ unchanged at 2, (ℤ/2)² at 3; odd n≥3 map isomorphism. |
| `N.8/the-rationals-infinite-against-finite` | 8.2 | Residue primes 2,3,5; infinite family versus finite sum. | K₂(ℚ) infinite torsion with div zero; direct-sum restriction retained. |
| `N.8/golden-congruence-lattices` | 8.6 | s=2/3; det-one stretch; q=t=4; ε norm −1. | Covolume exponents correct; t<q essential; absolute norm required. |
| `N.8/golden-residue-section` | 8.7 | x=y=1; inverted fraction; two distinct stretches. | Cross-difference bound 4tt′; residue direction and independence retained. |
| `N.8/golden-large-prime-cutoff` | 8.7 | q>33; tied earlier norm; zero difference; three simultaneous coordinates. | Four strict inequalities and inverse-generator argument checked independently. |
| `N.8/golden-finite-prime-certificates` | 8.8 | All eleven primes including inert 2/3 and conjugate split primes. | 173 exact rows and 23 signed minors independently pass. |
| `N.8/real-quadratic-upper-generation` | 8.9 | g={−1,−1}, h={−1,ε}; ε²=ε+1; all prime steps. | Relations give upper bound four without special values. |
| `N.8/real-quadratic-example-and-birch-tate` | 8.9 | Real signs (−1,−1),(1,−1); reversed embedding order. | Independent lower bound four; 4/120=1/30 only downstream check. |
| `N.3:finite-generation/number-ring-l-finite-generation` | 3.5 | ℤ; real quadratic ring; invert 2 or not; characteristic 2 excluded. | Periodic symmetric/quadratic finiteness and Witt-injection input distinguished. |
| `N.3:finite-generation/genuine-l-finite-generation` | 3.5 | m=0: cuts −2/−1; m=1: cuts 0/1; both signs. | Every integer genuine L-degree covered without comparison gap. |
| `N.3:finite-generation/classical-gw-finite-generation` | 3.5 | Classical degrees 0,1,2,3 and both signs. | Needs actual classical nonnegative fibre sequence, not comparison only ≥4. |
| `N.6/bott-cohomology-slot` | 6.15 | j=0/−1, both signs; j=1 positive is H²(2). | Signed integer twist and total degree checked; no conjugation substitution. |
| `N.6/bott-adams-edge-splitting` | 6.15 | q=3 versus q=2; identity/composite scheme maps. | Odd-modulus projectors split actual edges naturally; 2 excluded. |
| `N.6/cyclotomic-bott-cohomology` | 6.15 | Cyclotomic base; k=0/−1; chosen primitive root. | All integer Bott degrees retained; trivialization dependence explicit. |
| `N.6/rational-bott-cohomology` | 6.15 | Rational base; positive/negative degrees 4k and 4k−2. | H⁰/H² parity table agrees with dualization, including negative twists. |
| `N.6/ordinary-to-bott-comparison-range` | 6.16 | Ordinary K₁(ℤ;ℤ/q)=0; inversion adds ℤ/q; i=0. | Degree-one exception and Picard proof at zero retained; no negative ordinary claim. |
| `N.8/arithmetic-k3-examples` | 8.10 | Gaussian free rank one versus rational rank zero; both w₂=24. | K₃ torsion 24 versus 48; actual ring/field isomorphisms retained. |

## Independent finite-certificate calculation

Used exact rational pairs [a,b] for a+bε, with ε²=ε+1. For every recorded
row, independently computed g^A−g^B−π_v g^C and obtained [0,0]; negative
powers used the exact conjugate/norm inverse. Checked earlier support,
residue images and generation of the indicated residue multiplicative
group. Formed each relation vector A−B and recomputed every listed signed
minor in its stated column order, followed by its gcd. Residue surjectivity
and gcd=q−1 give both index inequalities. All eleven certificates passed.

| π_v | q | Exact relation rows | Signed minors | gcd |
| --- | ---: | ---: | ---: | ---: |
| [2,0] | 4 | 4 | 2 | 3 |
| [−1,2] | 5 | 3 | 1 | 4 |
| [3,0] | 9 | 4 | 1 | 8 |
| [3,1] | 11 | 15 | 3 | 10 |
| [4,−1] | 11 | 12 | 2 | 10 |
| [4,1] | 19 | 14 | 2 | 18 |
| [5,−1] | 19 | 16 | 2 | 18 |
| [5,1] | 29 | 27 | 3 | 28 |
| [6,−1] | 29 | 20 | 2 | 28 |
| [5,2] | 31 | 22 | 2 | 30 |
| [7,−2] | 31 | 36 | 3 | 30 |
| Total | | 173 | 23 | |

The large-prime argument was checked separately: covolumes 5q and
5√5q², strict t<q, the 4tt′ cross-difference bound, simultaneous
three-coordinate representatives, inverse prime generators, tied norms and
ordinary-unit height bound. The cutoff follows from 320/π²<33 and
the remaining displayed inequalities. The finite upper bound and independent
real sign vectors then both give order four. No special-value theorem was
used for either bound.

## Lean signatures and final validation

All seven definitions have real bodies. All twelve named theorem signatures
were matched to the README, exceeding the required ten-signature spot check.
There are twelve proved examples, at most two per kept definition.

| Definition or theorem | Instances and signature audit | Result |
| --- | --- | --- |
| `sUnitSubmonoid`; `integer_isLocalization_iff` | Arbitrary Dedekind R and arbitrary S; 1/0, empty/full S, field case, nonprincipal prime. | The criterion includes both unit containment and meeting every inverted prime. |
| `integer_isLocalization_of_torsion_classGroup` | Torsion rather than finite class group; infinite S permitted. | Generality matches §1.1. |
| `borelRank`; `borelRank_even` | Real/imaginary signatures; n=0,2,3,5. | Numerical n=0 allowed; arithmetic n≥2 retained. |
| `divisibleSubgroup`; `mem_divisibleSubgroup_iff` | ℚ, ℤ, ℤ/4, zero group; every positive multiplier. | Images in ambient A; compatible roots not asserted. |
| `divisibleSubgroup_eq_bot_of_finite`; `divisibleSubgroup_int` | Finite additive groups and integers, respectively. | No unjustified claim that div A is itself divisible. |
| `bottCohomologySlot`; `bottCohomologySlot_totalDegree` | Both signs at j=0 and −1; integer twist and cast of cohomological degree. | Computed witnesses fix dualization parity and 2t−c=2j. |
| `evenTwoRank`; `evenTwoRank_add_prime` | All four even residues, n=0, odd n, s=0/1. | hs≥1 is necessary; new proved truncated-subtraction control. |
| `bernoulliTop` | k=0,1,2; arithmetic B₁ versus primed B₁. | New proved value −1 at zero; positive convention begins at k=1. |
| `IsRegularPrime`; `kummer_criterion` | p=0,1,2,3,37; empty Bernoulli range at 3. | Predicate totalization explicit; theorem requires prime and odd. |
| `isRegularPrime_three` | Empty `Finset.Icc 1 0`. | No index-zero Bernoulli term. |
| `isRegularPrime_of_lt_37` | Prime p<37, including separate p=2. | Prime and strict bound present. |
| `not_isRegularPrime_37` | B₃₂ numerator, k=16 in 1…17. | Correct first irregular-prime target. |

The tests for numerical signs and conventions whose carriers exist at the
pins are proved Lean examples. The remaining boundary/symbol/transfer
witnesses stay in the README with their heavy definitions, as required by
the current package shape; introducing substitute carriers to force those
tests into Lean would violate that shape.

- Initial and revised `lean-check`: exit 0; only twelve declaration-uses-sorry
  warnings, no other warnings or errors. All examples are proved.
- `python3 scripts/check_blueprint.py` on the ArithmeticKTheory packet family:
  zero errors and zero warnings for each packet. Packets were read-only.
- `python3 research/blueprint/intake.py check-files` on the three package
  files, `review.json` and this report: zero problems.
- `git diff --check`: passed. Exact inventory/list checks: all 139 effective
  targets occur once in the pass table; all 60 Checks blocks are lists with
  at least three items; seven real-bodied definitions, twelve named theorem
  signatures and twelve proved examples occupy 212 Lean lines.

## Handoff

Resume with U1's arithmetic uniform-bound argument, U2's compatible
exceptional dyadic image proof, and U3's original map/proof sources. Keep the
139-target inventory, all tests, the independently checked eleven certificates
and the compact Lean shape. No source text encountered in this review
requested suspicious actions. No fetched code was executed, no private source
was copied, and no work was delegated.
