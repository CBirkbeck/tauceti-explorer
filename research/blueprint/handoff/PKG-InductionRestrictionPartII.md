# PKG-InductionRestrictionPartII — blocked checkpoint

Issue #7592. Worker: Codex (GPT-6), session `codex-UvrQhG`, 2026-10-10.
Claim comment [6101344803](https://github.com/CBirkbeck/tauceti-explorer/issues/7592#issuecomment-6101344803)
was confirmed by bot comment
[6101346366](https://github.com/CBirkbeck/tauceti-explorer/issues/7592#issuecomment-6101346366).
This continues the merged checkpoint [#8562](https://github.com/CBirkbeck/tauceti-explorer/pull/8562).
The package remains incomplete because two prerequisite suppliers in the
accepted plan are unassigned. This is not an implementation blocker caused
by admitted proofs, and this run did not exhaust its eight-hour allowance.

## Changes in this run

The README now states the generating hypothesis directly in both
`fiber_product_commutator` and `fiber_product_abelianization`. The latter also
states the required isomorphism on abelianizations and identifies its source
as the parent's stem-cover interface. The existing Lean signatures already
carried these hypotheses; no theorem hypothesis was changed there.

The commutator calculation needs surjectivity of the class-degree map, so it
also applies to an arbitrary projection S→G when that degree map is onto.
Surjectivity of S→G itself is not needed for this calculation. This is the
generality already expressed by the inherited `fiber_product_commutator`
signature, whose generating hypothesis supplies degree-map surjectivity.

Two additional native admitted examples record the counterexample with G=S₃,
π=id and c=∅. Its pullback is [S₃,S₃]=A₃, of order three; the pullback's
commutator subgroup is trivial and its abelianization has order three, whereas
the class-degree lattice is zero. Thus both displayed formulas fail without
the generating hypothesis. This instantiates the accepted plan's existing
EVW auxiliary-fiber-product source correction; it introduces no new source
issue or target.

No packet, source reader, ownership assignment, library or other roadmap was
changed. `metadata.toml` remains absent so this submission is a checkpoint.

## Verification

- `lean-check research/blueprint/packages/InductionRestrictionPartII/Suggested.lean`
  exited 0: 652 warnings, all declarations using `sorry`; no errors or other
  warnings. The preflight had 100 GiB available. No library build, cache
  download or language server was started.
- `python3 scripts/check_blueprint.py research/blueprint/packets/InductionRestrictionPartII.json`
  exited 0 with zero errors and zero warnings. The unchanged packet reports
  109 nodes, five gaps, one request, six planned stages and zero closed stages.
- Static inventory checks found all 109 target names, 124 API names and 96
  test labels in both README and Suggested. API/test names were compared by
  their last namespace component. Suggested contains 544 distinct named
  declarations and 204 anonymous examples, with no duplicate named
  declaration. The README is 140,525 bytes.
- An independent finite permutation calculation enumerated S₃ and all 36
  ordered product pairs, generated its commutator subgroup, then generated
  that subgroup's commutators. The respective orders are 6, 3 and 1; hence
  the empty-marking pullback and its abelianization have order three. This
  validates the mathematical counterexample, rather than treating admitted
  Lean examples as proved tests.
- `git diff --check` passes. Only this job's allowed files are changed.

The inventory proves name coverage, not semantic correctness. The scoped
audit checked the principal RS.1–RS.5 interfaces for orientation, generation,
arbitrary kernels, power corrections, actual fixed fibers, primary support
and complement conjugacy. It was not a new declaration-by-declaration source
certification of all 109 nodes. The inherited RS.6 finite-model calculations
in #8562 were not rerun; their coordinate formulas and hypotheses are retained
in the README and Suggested file.

## Blocking prerequisite contracts

The accepted review is a complete target-level planning pass, not a closed
prerequisite graph. The packet itself records these two exact ownership gaps:

1. **Natural integral homological bridge.** On the existing native
   `groupHomology`/`groupCohomology` carriers, supply arbitrary-abelian-kernel
   integral degree-two UCT, including infinite trivial-action kernels;
   natural evaluation on [x|y]−[y|x] as XYX⁻¹Y⁻¹; homological five-term
   transgression for central extensions; finiteness and order annihilation
   of finite-group positive-degree homology; coprime degree-two LHS reduction
   including the incoming d₃; and the free-abelian Ext¹-vanishing adapter.
   Consumers include RS.1 `homology-image` and `reduced-cover`, RS.2
   `marked-pullback-split`, RS.3 `finite-level-action`, RS.5
   `multiplier-primary-support` and `compatible-covers`, and RS.6
   `odd-index-two-reduction`. The parent is not the assigned supplier of
   this general package.
2. **Cyclic coprime complement conjugacy.** For finite coprime H,C with C
   cyclic, every complement to H in H⋊C is H-conjugate to the standard
   complement. Applying this to C=⟨γ⟩ identifies equal-order lifts of γ.
   It is needed by RS.5 `admissible-inertia-classes`; Suggested exposes the
   consuming statement as `admissible_inertia_cyclic_conjugacy`.

Section 20 and the upstream checklist require specified prerequisite chains;
an unnamed homological input contract does not supply an owner. The issue
expressly prohibits packet edits and directs plan mistakes into this handoff.
Assigning these inputs or silently adding a new prerequisite layer would
alter the source-of-truth plan. A planning amendment outside this package's
allowed files must assign their owners and exact contracts. No permission
question is pending, and no second job was claimed.

## Current upstream boundaries

The read-only current roadmaps were inspected at
`81207c7f16d5abf770f13a7d2bdcdb465c030787`, current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The InductionRestriction and
SemisimpleAlgebras READMEs were read in full, with relevant Suggested and
AlgebraicTopology interfaces inspected. The reviewed library audit has no
direct Part II entry; its R17.5 and MP.1 entries consume the parent's
projective/factor-set interfaces.

- **InductionRestriction Layer 7** owns ordinary Schur covers, factor sets
  and projective representations. Preserve that request. Its H²(G,kˣ)
  multiplier is not the integral H₂ carrier or a generic UCT supplier.
- **AlgebraicTopology Stage 6, item 1** already owns the natural singular
  UCT with arbitrary coefficients over a PID/hereditary ring. Stage 5 owns
  topological transfer and Cartan–Leray. Do not replan them. The native
  group/bar/extension-class adapters remain to be assigned.
- **Current Tau Ceti transfer** has
  `TauCeti.groupHomology.transfer_comp_map_subtype_id`, in
  `RepresentationTheory/Homological/GroupHomology/Transfer/Basic.lean`.
  Its statement gives transfer followed by inclusion as subgroup index
  times the identity. Combined with Mathlib's
  `groupHomology.isZero_groupHomology_succ_of_subsingleton`, it provides
  an order-annihilation route via the trivial subgroup. It does not provide
  the entire bridge and is absent from the pinned build.
- **Pinned Mathlib Schur–Zassenhaus**:
  `Subgroup.exists_right_complement'_of_coprime` and its left variant
  conclude existence of a complement. Their statements were read in
  `GroupTheory/SchurZassenhaus.lean`; neither asserts conjugacy. Current
  Frobenius-complement interfaces have additional hypotheses.

The Lean check uses Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`
and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, not current main.
Nothing was built or edited in the current upstream checkouts.

## Sources inspected

Fresh public downloads matched the accepted plan's hashes; access date
2026-10-10. The cleared-source index was consulted; no restricted source was
used, and no source passage was copied into the repository.

| Source | Relevant reading | SHA-256 |
| --- | --- | --- |
| Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021), [author PDF](https://people.math.harvard.edu/~mmwood/Publications/lifting.pdf?download=1) | §2, pp.2–4, especially Lemma 2.4 and Theorem 2.5; §4 action formulas, pp.6–7 | `9628210e96313805ceac89594c64e2eceb3aaebf044f617cee4d7f25ee7ef673` |
| Liu–Wood–Zureick-Brown, *A predicted distribution for Galois groups of maximal unramified extensions*, Invent. Math. 237 (2024), [published PDF](https://par.nsf.gov/servlets/purl/10509628) | Lemma 12.10 and proof, PDF pp.62–63 (journal pp.110–111); proof of Theorem 10.4, PDF p.64 (journal p.112) | `64295273b34676cb6fd0f1de5fc643d1744e3359f94382ea77303903cdb6dc91` |

Wood's Lemma 2.4 uses generation to lift cover elements to the pullback;
Theorem 2.5 needs UCT with the potentially infinite universal kernel.
LWZB's proof of Theorem 10.4 uses conjugacy of the equal-order inertia lifts,
in addition to complement existence. The accepted plan's ten source issues
are unchanged.

## Resume after the planning amendment

1. Assign the two suppliers above, respecting tiers and reusing existing
   upstream inputs. Then replace the package's unnamed input contracts by
   citations of the assigned layers and reconcile their native adapters.
2. Continue semantic reconciliation against the accepted statements. All
   31 row-certificate signatures and all 38 RS.6 targets already exist.
   Do not repeat the earlier row-signature inventory work. In particular,
   rows 13/24 use the specified affine sum kernels, 16/17 the native SL₂(𝔽₃)
   graph/sum models, 22/23 the specified Heisenberg graph/sum models, and
   30/31 inverse transpose on SL₃(𝔽₂) and its full wreath model.
3. Preserve oriented class maps, specified projections and embeddings,
   centralizer enumerations, actual relation subgroups and group-valued
   quotient outputs in every certificate. GAP values are source evidence,
   not certificates. Proving the admitted cover/table targets is future
   library implementation, not a prerequisite for a signature package.
4. Recheck Suggested after changes. Add `metadata.toml` with
   `topic = "math.GR"` when the ownership boundary is resolved and the
   package meets section 20.

No scratch artifact is required to resume. The useful next step is the
planning amendment, rather than another package-only assignment with the
same supplier gaps.
