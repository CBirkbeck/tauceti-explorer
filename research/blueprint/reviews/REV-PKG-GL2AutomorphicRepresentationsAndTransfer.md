# Independent package review: GL₂ automorphic representations and transfer

**Verdict: accepted after corrections.** Codex, session `codex-lYzqpw`,
2026-10-10; issue #7929. This reviewer did not perform the package job.

The review read both accepted plan parts, the entire package README and
Suggested.lean, the reviewed library audit, relevant source statements and
dependency interfaces. All six package-review requirements hold after the
reader corrections below. Acceptance concerns a roadmap specification;
placeholder proofs do not establish its mathematical targets in Lean.

## Findings and corrections

- Restored the hypothesis of the pinned full-GL₂ nonsolvability theorem:
  the field contains a nonzero element whose square is not one. The unqualified
  claim was too broad; in particular, it could not exclude solvable GL₂(𝔽₃).
- Supplied missing page locators for Haar/central quotients, finite-level
  automorphic functions, spherical Whittaker functions, supercuspidal
  parameters, the classical L-function comparison and the primitive
  holomorphic correspondence. The last two explicitly use the AF.5
  normalization rather than attributing that entire dictionary to JL70.
- Corrected Webb's statement kinds: Lemma 10.1.1, Theorem 9.2.6,
  Lemma 9.4.6 and Corollary 9.4.7, retaining the verified printed pages.
- Corrected the cubic construction's Cogdell Theorem 3.1 locator to p. 6;
  Theorem 3.3 remains on p. 9. Added Henniart's Proposition 3.2, p. 30,
  as the precise rank-three uniqueness input.
- Replaced the nonexistent `RepresentationTheory/CharacterTable Layer 3`
  realization reference with `RepresentationTheory/InductionRestriction
  Layer 6`. Its cyclotomic splitting-field target includes Schur-index and
  descent obligations; an identity of virtual characters does not itself
  realize an ordinary character over a number field.
- Qualified the adjoint's two bare G7 references as
  `ArithmeticGaloisRepresentations G7`. Removed two repeated sentences and
  corrected a grammatical slip to retain the size bound without losing any
  hypothesis, API or test.

Suggested.lean and metadata.toml needed no edits.

## Six required checks

| Requirement | Result |
| --- | --- |
| Upstream form | The document extends ModularForms, states owners and conventions, and gives layered statements, proof routes, dependencies, APIs and distinguishing examples. Current CharacterTheory and InductionRestriction were read with their suggested files; ModularInduction, ModularForms and ClassFieldTheory supplied additional boundary/style checks. Final README: **199,979 bytes**, below 200,000. |
| Fidelity and closure | **112/112** accepted targets have distinct reader anchors; both packets' statements and hypotheses were compared with the reader. All **19** accepted definitions/constructions retain their API and at least three distinguishing tests. Additional arithmetic and geometric targets supply the accepted plans' inherited obligations and downward ownership moves. |
| Sources and own words | The reader states the mathematics in its own words, without source passages or a source's section-by-section digest. All **122** source paragraphs have page locators; bibliography keys resolve. Numbered statements and section locators were checked, especially the corrected citations and the construction chains discussed below. Cleared books were read in place. |
| No programme process | README contains no packet filenames, job identifiers, review/checkpoint narrative, coverage statuses, `FoundationsAndLibraryIntegration` or `UPSTREAM:` placeholders. Mathematical stage identifiers remain as dependency locators. |
| Suggested Lean | This reviewer ran `lean-check research/blueprint/packages/GL2AutomorphicRepresentationsAndTransfer/Suggested.lean`: **exit 0, no errors, 153 warnings, all declaration-uses-sorry**. Native signatures, their hypotheses and concrete examples were read against the README. No fake `Prop := sorry` condition or arbitrary replacement automorphic carrier was found. |
| Metadata | Exactly one line: `topic = "math.NT"`, appropriate to these automorphic and arithmetic targets. |

The two accepted packets independently pass `scripts/check_blueprint.py`
with **0 errors and 0 warnings** each. Anchor/API/source checks supplement,
and do not replace, the mathematical reading.

## Mathematical checks that control acceptance

**Local conventions and classical comparison.** Checked upper-Borel normalized
induction, the Steinberg constituent orientation, last-row K₁ invariants,
Casselman's dimension formula and the transported lower-right K₀ character.
The spherical and Iwahori formulas retain repeated Satake roots; the ramified
dictionary distinguishes a one-character factor, Steinberg and supercuspidal
factor one. CDT's K(n)-fixed type uses Lemma 4.2.4(3), rather than replacing
that space by a larger representation. Real weight one's full-O(2) limit,
complex gamma/epsilon conventions, arithmetic rationality twists and the
cohomological dual's Frobenius inversion agree with their stated conventions.
The primitive dyadic compact type has conductor three and Swan conductor one;
the quadratic type field is not asserted to induce its Weil parameter.

**Transfer and the cubic construction.** The cuspidal JL domain excludes norm
characters and retains the split-algebra case. The raw local functional-equation
sign and the extended residual correspondence are distinguished. For non-normal
cubic transfer, JPSS Theorem 14.2, pp. 253–254, and its monomial discussion,
p. 255, supply all-place cubic character induction. Henniart 1983,
Theorem 2.10 and Proposition 3.2, and Henniart 2002, Theorem 1.5, supply
rank-three recognition and local pair-factor compatibility respectively.
The reader explicitly deduces the transfer by tensor induction and the full
rank-two converse theorem, retains local induction constants, and proves their
global product is one. A norm pullback induces a character plus its twist of
the quadratic-resolvent representation; this identifies the exact noncuspidal
exception. The output's bad components and monodromy are prescribed before
the converse is applied. Mao–Rallis's weak trace route is identified separately.
The all-place Artin upgrade keeps infinity matching and uses local stability,
full character prescription and unitary pole separation, without assuming
Artin entireness to construct the original weak automorphic representation.

**Arithmetic lifting and character prescription.** Chevalley's Theorem 1,
p. 36, and primary proof §§1–5, pp. 36–39, support the S-unit congruence route,
including saturation, cyclotomic descent and the dyadic exponent enlargement.
The ray quotient in full local prescription is finite; character order may grow
and auxiliary ramification is allowed. This avoids a fixed-order
Grunwald–Wang assertion. Brauer characters lift eigenvalues on p-regular
elements and are not modular traces. Fong–Swan supplies an ordinary lift;
stable free lattices and Brauer-character recognition supply actual residual
conjugacy. Its all-rank signature includes characteristic two, while oddness
lifting requires odd characteristic. Tate's coefficient module is trivial
discrete ℚ/ℤ, and finite-image projective lifting permits enlargement of the
roots-of-unity group. Residual characteristic-two restriction is proved
directly, without importing a characteristic-zero Mackey criterion.

**Geometry and analytic closure.** Classical attachment uses primitive
parabolic multiplicity and coefficient descent, rather than an oldvector
eigenspace or a presumed higher-tier attachment. The ramified comparison
retains the compactification boundary. Varshavsky's contraction is applied
to the reordered curve correspondence, with duality for the reverse case;
equal ramification orders are excluded. Joint spectral estimates include
individual scalar/intertwining bounds and a finite-measure comparison, not
a finite truncation of the spectrum. Globalization retains the fixed-centre
projection and balanced archimedean Euler–Poincaré sign.

## Ownership and limits

Read-only current roadmap main was
`3c18d9fbfceed0dc5c1edb1070a3927152d19e28`; current Tau Ceti was
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The nine roadmap additions named
in WORKERS.md and the four named completed roadmaps were screened with their
Suggested.lean files. No duplicate of the GL₂ transfer or modular-character
targets was found. Ordinary characters, finite induction, restricted products,
generic local LLC, analytic factors and general cohomology keep their suppliers.
Pinned declaration statements were checked at Mathlib `082e2d3` and Tau Ceti
`f790474`, rather than inferred from names. The ClassFieldTheory and
InductionRestriction link maps support the retained normalization and
splitting-field boundaries.

The package implements the tier-15 downward ownership dispositions:
full-local character prescription in R16.1; classical attachment and conductor
comparison in R17.6; quadratic induction before the cubic construction in
R17.4, with its old anchor preserved. Corresponding higher-consumer and packet
repointing belongs to their own jobs and was not performed here. The accepted
packets' older gap/request records were not edited or represented as closed.
Named §13 signature omissions identify the concrete supplier objects needed;
algebraic examples do not stand in for unstated automorphic theorems.

No unresolved mathematical issue requiring `needs_changes` remains in this
package review. Implementation of the planned results remains work for the
roadmaps' contributors.
