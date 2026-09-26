# BP-ShimuraCompactifications--C6

## Continuation checkpoint — 27 September 2026

Agent: ChatGPT — `gpt-20260927-b8d41e`. Refs #991. Continues the merged checkpoint from PR #3126.

**Status: partial.** This continuation supplies the mathematical trace-dual proof behind the root-of-unity change-of-uniformization factor, together with four source-facing native Lean prototypes and seven acceptance examples. It does not construct a Hilbert cusp, prove the stabilizer congruences, or close the geometric descent inputs.

Only this handoff and the suggested Lean file change. The packet and definitive reader remain unchanged: 12 nodes (8 lemmas, 4 theorems), no definitions/constructions or definition API items, 3 planets, 11 cited baseline declarations, 11 requests, 4 gaps. The four additional names live in `TauCeti.HilbertCusp.UniformizationPrototype`; they are not new packet IDs, reserved names, or claims that new general foundations are missing. Integration must first decide which consequences belong to the existing H1/H3 or C0 interfaces, and update the packet and reader together. The existing eight arithmetic declarations and seven examples are retained; the suggested file now contains twelve theorem signatures, fourteen examples and four baseline checks.

**Lean compilation: not run for this revision. Full packet validator: not run.** The previous worker's compilation and validator results below are historical, not verification of the changed suggested file. A standard-library exact-arithmetic scratch program passed the checks recorded below. No implementation or independent-review verdict is claimed.

### Inputs checked in this continuation

Read the live issue and comments, the previous handoff, the packet's arithmetic statements and requests, and the suggested file. Read the accepted C6 audit row in `AUDIT-10.result.json` and `REV-AUDIT-10.md`; the aggregate `data/library-coverage.json` reader returned empty content, so equality with that aggregate was not freshly checked. Read the RS-32 ownership explanation: the toric anchor, H1/H3 objects and C4 relative charts remain suppliers. No boundary or planet is changed.

Read Dimitrov's author-hosted copy at https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf, especially Proposition 4.1(ii), physical page 13 / printed p. 537, and the formula after (5), physical page 22 / printed p. 546. The relevant page counts here are one-based; the browser PDF page indices were 12 and 21. The PDF text was retrieved, but the screenshot attempt failed, so this is not a claim of fresh visual collation. The arXiv PDF fetch also failed in this continuation. The author copy is not promoted to a verified version of record. No new source error is alleged.

Read the exact pinned Mathlib source of `Submodule.traceDual`, `Submodule.mem_traceDual`, and the nearby trace-dual comparison statements in `Mathlib/RingTheory/DedekindDomain/Different.lean` at `082e2d37e8b0463410cdb532e111cd43d5a66174`. Also read the pinned Tau Ceti `RingTheory/DedekindDomain/Different/Basic.lean` at `f790474821cf4256814db967cb154e7af3d0c369`, including its fractional-ideal/submodule coercion bridge. These are existing carriers and membership results, not proposed new definitions. The membership statement uses the image of the integer algebra map in Q, exactly the integral trace condition below. No fresh whole-library absence audit is claimed.

## Uniformization-phase proof supplement

### 1. Existing objects and the actual source specialization

Let K be a number field, let A and B be Z-submodules of K, and suppose

    A ⊆ B,       n B ⊆ A,       n >= 1.

Write I^vee for the existing trace-dual submodule:

    I^vee = {x in K : Tr_(K/Q)(x a) is an integer for every a in I}.

This is mathematical notation for Mathlib's `Submodule.traceDual Z Q`, not a replacement definition. Inclusion reverses: B^vee ⊆ A^vee, by applying the defining condition to elements of A. No projectivity, choice of basis, perfectness of the pairing, or total reality is required for the elementary statements that follow.

For Dimitrov Proposition 4.1(ii), use the underlying Z-submodules of the actual fractional ideals

    A = a b,       B = a b',       X = B,

where n is the exponent of b'/b. Multiplying n b' ⊆ b by a gives n B ⊆ A. An element of an ideal product is a finite sum of products, so the latter inclusion follows term by term; it is not an additional finiteness assertion. The source's trace-dual convention is f* = f^(-1) d^(-1), and a change of uniformization is a class in A^vee/B^vee. Identifying these objects with the H1/H3 cusp data remains a supplier comparison, not a new cusp structure whose fields assume the desired conclusions.

Let R be a commutative ring and let zeta be a unit with zeta^n = 1. The geometric source chooses an appropriate primitive cyclotomic root on its coefficient cover. Primitivity is unnecessary for the elementary lift-independence proof, and may be lost after a coefficient-ring map.

### 2. Integral exponent — prototype `trace_exponent_integral`

**Statement.** If xi belongs to B and x belongs to A^vee, there is a unique integer m(xi,x) satisfying

    m(xi,x) = n Tr_(K/Q)(xi x)

as an equality in Q.

**Proof.** Since n xi belongs to A, the defining condition on x says that Tr(x(n xi)) is in the image of Z in Q. By Q-linearity of trace and commutativity of K this trace equals n Tr(xi x). This supplies the integer witness. Injectivity of Z -> Q supplies uniqueness. The native prototype states existence; uniqueness is the existing injectivity consequence, not another proposed carrier.

The prototype needs only the stated inclusion n B ⊆ A, not A ⊆ B. It also remains true for n=0. The full quotient interpretation, rather than this supporting implication, uses the positive exponent and A ⊆ B.

### 3. Changing the lift — prototype `trace_exponents_congruent`

**Statement.** If xi belongs to B and x' - x belongs to B^vee, and m,m' are integer witnesses for the two displayed trace expressions, then

    m' = m + n k

for some integer k.

**Proof.** Membership of x'-x in B^vee gives an integer k with Tr(xi(x'-x))=k. Linearity gives, in Q,

    m' - m = n Tr(xi(x'-x)) = n k.

Injectivity of the integer inclusion gives the asserted equality in Z. When x is in A^vee, the inclusion B^vee ⊆ A^vee also shows that x' is in A^vee, so section 2 supplies both witnesses. The native statement separates existence of the witnesses from their congruence, avoiding a hidden choice function or an unproved quotient construction.

The quotient is by **B^vee**, not by A^vee. For K=Q, A=Z, B=(1/4)Z, take xi=1/4 and x=0, x'=1. The difference lies in A^vee=Z but not in B^vee=4Z. The integer exponents are 0 and 1, and the phases for zeta=2 in Z/5 differ. Thus using the larger equivalence relation would be false.

### 4. Independence of the cyclotomic phase — prototype `phase_independent_of_lift`

**Statement.** Under section 3 and zeta^n=1,

    zeta^m' = zeta^m

in R^times.

**Proof.** Write m'=m+n k. The integer-power laws in the existing unit group give

    zeta^(m+n k) = zeta^m (zeta^n)^k = zeta^m.

Integer, not truncated natural, powers are needed because trace exponents and k may be negative. No cancellation by a coefficient, reducedness, domain assumption, or nontriviality of R is used. In the zero ring the unit group is trivial and the identity is still meaningful.

Consequently the rule

    chi_[x](xi) = zeta^(m(xi,x))

is well-defined on x in A^vee/B^vee. This is a mathematical description of the intended character, not a new bundled character definition in this checkpoint.

### 5. Character law — prototype `phase_additive_in_character`

**Statement.** For integer witnesses m_xi, m_eta and m_sum of n times the three corresponding traces,

    zeta^m_sum = zeta^m_xi zeta^m_eta,

where the sum witness uses xi+eta and the same x.

**Proof.** Trace linearity and distributivity give m_sum=m_xi+m_eta after using injectivity of Z -> Q. The integer-power addition law gives the result. This implication does not need the root relation zeta^n=1; that relation is needed for quotient independence, not for the additive character law with specified witnesses.

Likewise chi_[x+y](xi)=chi_[x](xi)chi_[y](xi), chi_[0](xi)=1, chi_[x](0)=1, and chi_[-x](xi)=chi_[x](xi)^(-1). The proof in the x variable is the same trace-additivity calculation. If a belongs to A, then Tr(a x) is an integer, so chi_[x](xi+a)=chi_[x](xi). Thus the phase also factors through B/A in the character variable. This establishes a bilinear multiplicative pairing

    (B/A) x (A^vee/B^vee) -> R^times.

It makes no claim that this pairing is perfect or that the chosen coefficient ring contains distinct values for all characters. In particular, the unramified case B=A has trivial phase, and n=1 forces zeta=1.

### 6. Consequences for coefficients and charts

For any R-module L, multiplication by chi_[x](xi) is an automorphism of L, with inverse multiplication by its reciprocal. Hence

    chi_[x](xi) * v = 0  iff  v = 0.

This statement does not require L to be free, flat or faithful. In particular, it applies to the actual invertible coefficient module a(kappa) without a global choice of basis. It strengthens the explanation of why changing uniformization preserves Fourier support: it is not necessary to identify the coefficient line globally with R. At xi=0 the phase is one, so this change of uniformization does not alter the constant coefficient.

For an already supplied character monoid P ⊆ B, the character law sends q^xi to chi_[x](xi)q^xi and defines an R-algebra automorphism of R[P]. Its inverse uses -x. One checks multiplication on monomials and then on finite sums. It preserves every specified monomial ideal, since each monomial generator is multiplied by a unit. Consequently it preserves every power of such an ideal I and induces compatible inverse automorphisms of R[P]/I^r. Taking the inverse limit extends it to the I-adic completion, with an inverse induced by -x. This argument does not interchange a completion with a tensor product.

In regular boundary coordinates it preserves the boundary product ideal (t), t=x_1 ... x_r, and extends to its localization because t maps to a unit times t. Thus a finite-pole expression stays a finite-pole expression. The same argument works for the appropriate Laurent polynomial factors. This is conditional algebra on C0's actual chart ring and ideal; it is not a construction of the formal Hilbert chart, a geometric quotient, or an algebraic-space action. If the phase character or completed monoid-algebra automorphism already occurs in C0/H3, consume that declaration rather than publishing it again.

Base change preserves the root relation and the phase formulas by mapping units and integer powers. It does **not** preserve nonzero coefficients under an arbitrary ring map: for example 2 in Z/4 becomes zero in Z/2. Therefore this phase calculation proves neither coefficient descent in Proposition 8.5(ii) nor the geometric q-expansion injectivity theorem. Both retain their existing formal-geometric inputs.

### 7. What is still missing before packet integration

The four prototypes use existing native objects and make four explicit supporting claims; they are not a verified missing-declaration inventory. Compare them with the exact H1/H3 supplier nodes, retain only genuinely new source-specific consequences, and then record those as atomic packet nodes with baseline and source locators. The mathematical dependency chain is trace-dual membership plus trace linearity -> integral exponents and lift congruence -> phase independence; trace linearity plus integer powers -> the character law.

Next identify the source's A=ab and B=ab' with the supplied cusp lattices, construct the actual class of a change of level uniformization, and match the character action with the map of semiabelian charts in Proposition 4.1. The monomial calculation alone does not prove that moduli map comparison. For the full stabilizer law following (5), prove the class of u xi*_(u,epsilon), its representative-independence and the relevant composition convention from the actual stabilizer extension. Do not guess the order of an action from a pullback formula, or silently omit the weight multiplier epsilon^(kappa/2)u^kappa.

After that, connect the existing coefficient-support argument to this genuine unit-valued action and to the completed-coordinate/finite-pole suppliers. The four geometric packet nodes, non-Noetherian extension, ordinary/Hasse comparisons, and modular-curve comparisons remain open exactly as in the previous checkpoint. No sourceIssue, request count, stage status or planet is changed here.

## Exact checks performed in this continuation

A Python standard-library scratch program used rational arithmetic in Q(sqrt(2)), representing a+b sqrt(2) as a pair of Fractions. For A=Z[sqrt(2)], its trace dual is generated by 1/2 and sqrt(2)/4; B=(1/n)A has dual n A^vee. With n=1,...,8 and coefficients in -2,...,2, it checked:

- 5,000 integral exponent identities n Tr(xi x)=a s+b t;
- 45,000 lift congruences m'-m=n(a p+b q), with p,q in -1,0,1;
- 5,000 additive exponent identities;
- 13,566 phase-lift identities for integer exponents -8,...,8 and shifts -3,...,3;
- 318,206 preservation-of-nonzero checks on two-coordinate modules over Z/r for r in {1,4,5,8,9,12,25}, using every unit satisfying the tested root relation;
- 10 boundary/nonexample checks, including the missing denominator factor, a nonannihilating n, the wrong trace-dual quotient, negative powers, a nonprimitive root, a nonunit killing a coefficient, zero character, n=1 and the zero ring.

All passed. These are finite checks, not proofs of the general statements; the proofs are given above. The scratch program was not installed as a repository test. Seven representative cases are expressed as placeholder examples in the suggested Lean file. No Lean executable was available in the local environment, and neither the new examples nor the changed import graph were compiled. The source check of `Submodule.mem_traceDual` is not a substitute for elaboration.

## Historical checkpoint — Codex, PR #3126

The following is the previous handoff, retained as historical context. Its successful compilation and validator results refer to that revision only.

Agent: Codex — codex-hjdg0j. Refs #991. First checkpoint; status partial.

### Work completed

Applied accepted RS-32 title and toric base. Read the C6 audit, campaign, atlas and every C6 link-map entry; preserved H1–H4 ownership, R11.3→C4 handoff and C6→B3/H5 direction. Read AnalyticToricGeometry in full and verified the previously read GrothendieckEulerForms and JacobianChallenge upstream documents unchanged. Searched both pinned source trees for existing Hilbert/Koecher/positivity/unit declarations.

Twelve nodes: eight lemmas and four theorems; zero definitions/constructions, zero API items and zero definition unit tests; three planets; eleven pinned baseline declarations; eleven precise requests; four gaps. Eight arithmetic signatures and seven acceptance examples are present in the suggested file, plus three baseline declaration checks. The four geometric targets retain explicit missing suppliers and signatures. No layer is closed and no implementation is claimed.

The coefficient proof uses Mathlib’s existing contracting unit, then takes a positive power into the finite-index cusp subgroup. A nonpositive nonzero exponent has a negative conjugate; its square-unit orbit has trace tending to negative infinity against a positive dual vector. Unit-valued coefficient transport contradicts a finite pole bound. Zero exponents and coefficient annihilators are handled separately.

### Precise resumption

- Decompose the actual Hilbert cusp data, stabilizer congruences, change-of-uniformization root-of-unity action and their APIs/tests, importing the H1/H3/H4 objects. No such construction is represented by the coefficient function used in the native prototype.
- Close the C0 completed-coordinate and F0 finite-pole/formal-detection requests, then replace the four geometric statement omissions in the suggested file by genuine signatures for the actual supplied objects. The coefficient proof does not itself construct a compactification.
- Construct and compare the toroidal/minimal ordinary-neighborhood models, semiabelian extensions, refinements and G*/G polarization quotients; separate free toroidal actions from possibly stabilizing minimal-boundary actions. Read and decompose the cited Rapoport, Chai, Faltings–Chai, Lan, and Birkbeck–Heuer–Williams inputs to the required hypotheses.
- Treat arbitrary primes, including discriminant primes and p=2, using H2’s actual ordinary locus and Hasse ideals; establish the T3–T5 interfaces. The source’s ramified level cusps are not ramified-base integral models.
- Prove the F=Q toroidal/minimal comparison using ModularCurvesPartII:R13.4a/R13.4b. PR81 Layer 10 supplies only prime N≥5 and diamond quotients H≤(Z/N)×/{±1}; full and composite levels require their owning modular-curve stages. No degree-one Koecher theorem is inferred.
- Decompose the remaining read source material, including Theorem 7.2 quotient construction, 7.6 semiabelian extension, 7.7 properness, Proposition 8.5(i)/(ii) q-expansion and coefficient descent, and the six assertions of Theorem 8.6 with their generic owners. The source inventory below distinguishes these from the selected twelve nodes.
- Verify the geometric theorem over non-Noetherian coefficient algebras if the full generality of Dimitrov’s statement is required; establish any limit or base-change arguments explicitly.
- Collate the two source misprints against the publisher edition and obtain independent review; the available typeset author copy alone is not represented as a verified version of record.

Keep all twelve identifiers. Start with the C0 completed-coordinate/F0 formal-detection interfaces and the H3 cusp stabilizer/weight-line calculation, then supply genuine geometric signatures. For the rest of C6 follow the source inventory; the unbuilt ordinary/Hasse and F=Q comparisons have not been silently replaced by the Koecher slice.

### Sources

Read all 28 pages of Dimitrov arXiv v3 in batches of at most three; rendered p. 24. Read author-copy physical pp. 1,22–24 and rendered printed p. 547. URLs, hashes, scope and two unreviewed misprints are in the packet. Publisher page returned HTTP 405. The bibliography’s Rapoport, Chai, Faltings–Chai, Lan, Mumford/Raynaud originals and the Birkbeck–Heuer–Williams ordinary/Hasse inputs are not independently decomposed here. The source inventory identifies the specific missing passages/results.

### Checks

Pinned Lean 4.34.0-rc2 compiled the named suggested file: exit 0, no errors, fifteen warnings, all from placeholder proofs. Eight named arithmetic signatures, seven acceptance examples and three baseline checks elaborated. All 8,482 reachable Mathlib import sources were byte-verified at the pin; the three reachable Tau Ceti modules were built afresh against those sources. Suggested-file SHA-256: 49e890e4ee35a31cb83551e94f8f7ff85360b97d3d4082597437394f28126a4a.

Indexed check_blueprint.py against the unmodified shared index: zero errors and zero warnings. The first CI run failed because that index omits the generated additive Finset.sum_pos_iff_of_nonneg. Its exact signature was checked by pinned Lean; the packet now cites the indexed generating declaration Finset.one_lt_prod_iff_of_one_le and explicitly records its to_additive consequence. The suggested file and its successful compilation are unchanged. No repository index or checker was edited.

Read-only intake.py check-files: four allowed deliverables, zero problems. Internal node graph is acyclic. Full snapshot comparison and fresh-main input/claim guards run before publication. These checks do not discharge the four geometric supplier gaps or prove the proposed theorems.
