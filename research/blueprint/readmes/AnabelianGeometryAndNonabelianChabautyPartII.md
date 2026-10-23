# Betts–Stix continuation: ownership disposition

The continuation requested by issue #3475 is already the accepted roadmap
[Galois sections and p-adic period mappings](GaloisSectionsPadicPeriodMaps.md).
Its permanent identifier is `GaloisSectionsPadicPeriodMaps`, its design job is
`DESIGN-BETTS-STIX` (#952), and its independent review is
[REV-DESIGN-BETTS-STIX](../reviews/REV-DESIGN-BETTS-STIX.md) (#953).
This document completes the duplicate assignment's routing audit. It introduces
no mathematical definitions, layers, API, tests or planets.

The maintainer should fold the generated job
`DESIGN-AnabelianGeometryAndNonabelianChabautyPartII` into that fixed job and
retire the duplicate identifier. This is the correction already requested by
the verified finding `RT-PAPER-BETTS-STIX-25/1`, the extraction's route 1, and
the accepted canonical packet's first restructuring proposal. The proposal
awaits the maintainer's queue action. These disposition files must not be
promoted as a second atlas roadmap; the PR is deliberately a draft to keep
ordinary intake from doing so. The custom `promotion.hold` metadata explains
the intent but is not an implemented intake guard.

The canonical roadmap extends `AnabelianGeometryAndNonabelianChabauty:NC.6`.
The base roadmap owns section classes and the section map. The continuation
owns their Selmer condition, the symplectic representations attached to
sections, the model-free period comparison, and the resulting finiteness
argument. Its ten layers SPM.0–SPM.9 are retained with their existing boundaries.
Supplier statements remain imported from their present owners, including the
Lawrence–Venkatesh and p-adic Hodge inputs. No direction additional to that
continuation occurs in this issue.

For the final targets, let K be a number field and Y/K a smooth projective,
geometrically connected curve of genus at least two. A Selmer section is locally
induced by a point at every place, including archimedean places; localisation
at a finite place is well defined using local injectivity of the section map.
The canonical targets give the following chain, with no section conjecture
assumed:

- Restricting the relative symplectic pair of any abelian-by-finite family along
  a Selmer section witnesses membership of its local point in that family's
  projected adelic Lawrence–Venkatesh locus (Theorem 7.1, pp. 54 and 56).
- At a self-conjugate finite place v, one can choose a Kodaira–Parshin family
  whose local Lawrence–Venkatesh locus is finite for every suitable finite S
  (Theorem 6.5, p. 44; proof §6.5, p. 53). Here S contains the places above p,
  infinity and bad reduction; the adelic locus projects into this local locus
  by Lemma 6.4, p. 44.
- If K contains no CM subfield, every finite place is self-conjugate
  (Definition 2.17 and Remark 2.18, p. 13). Consequently the image of Selmer
  sections in Y(K_v) is finite at every finite v (Theorem A, p. 1).
- The Harari–Stix identification of the modified finite-descent locus with
  total Selmer localisation then gives a finite projection of that locus to
  each Y(K_v) under the same hypotheses (Theorem B, p. 2).

These conclusions concern local images, without asserting finiteness of all
global sections. For fields containing a CM subfield, the self-conjugate-place
result remains the applicable statement. The canonical reader and packet
retain the exact hypotheses, API and discriminating tests for the intermediate
targets; this crosswalk imports those targets without restating them.

The source for every locator below is Betts–Stix,
[*Galois sections and p-adic period mappings*, arXiv:2204.13674v1](https://arxiv.org/pdf/2204.13674v1),
28 April 2022 (59 pages). The published Annals revision was not compared.
This audit read the introduction and selected statements/proofs listed in
the packet's `sources[0].readSections`; it relies on the accepted independent
review for the canonical plan's full mathematical audit. It is not a new
independent review of that plan. No source passages or source files are
included here.

The table is a routing crosswalk of all 48 items assigned by route 1, rather
than a summary of the paper. Node names are relative to the sole owner
`GaloisSectionsPadicPeriodMaps:`. The machine-readable `targetImports` array
contains the fully qualified references and their owning layers.

| Extraction item | v1 locator | Existing owner nodes |
| --- | --- | --- |
| /2 | Definition 1.1, p.1 | `SPM.0/selmer-sections` |
| /3 | Theorem A, p.1 | `SPM.9/theorem-a` |
| /5 | §1, p.2 | `SPM.0/modified-finite-descent-locus`; `SPM.0/harari-stix-finite-descent` |
| /6 | Theorem B, p.2 | `SPM.9/theorem-b` |
| /7 | Remark 1.3 and footnote 1, p.3 | `SPM.9/obstruction-comparison`; `SPM.8/parameter-comparison` |
| /8 | Remark 1.4, p.3 | `SPM.6/non-symplectic-locus` |
| /9 | Remark 1.5, pp.3–4 | `SPM.1/sections-restrict-local-systems` |
| /19 | §2.2.3, Example 2.12, pp.10–11 | `SPM.2/restriction-induction` |
| /20 | Definition 2.13, Remark 2.14, p.11 | `SPM.2/automorphism-group` |
| /21 | Lemma 2.15, p.12 | `SPM.2/orbit-lemma` |
| /22 | Proposition 2.16, p.12 | `SPM.2/automorphism-dimension-bound` |
| /23 | Definition 2.17, Remark 2.18, p.13 | `SPM.3/self-conjugate-place` |
| /24 | Proposition 2.19, pp.13–14 | `SPM.3/conjugate-places-weights` |
| /25 | Remark 2.20, p.14 | `SPM.3/self-conjugate-character-restriction` |
| /26 | Corollary 2.21, pp.14–15 | `SPM.3/average-hodge-tate-weight` |
| /31 | Theorem 3.3, pp.16–17, proved in §3.5 | `SPM.4/period-maps-control-dpst` |
| /32 | Proposition 3.5, p.17 | `SPM.4/period-map-controls-local-representations` |
| /46 | Theorem 3.22, pp.28–29, proof pp.31–32 | `SPM.4/horizontal-transport-polyannulus`; `SPM.4/horizontal-de-rham-transport` |
| /47 | Lemma 3.23, p.29 | `SPM.4/polydisc-reduction` |
| /54 | Definitions 4.3–4.4, Example 4.5, pp.33–34 | `SPM.1/symplectic-pair`; `SPM.1/fibre-symplectic-pair` |
| /56 | §4.1.3, p.35 | `SPM.5/p-adic-hodge-symplectic-pair` |
| /60 | Definition 4.10, p.37 | `SPM.5/lagrangian-period-modules` |
| /61 | Proposition 4.11, p.37 | `SPM.5/abelian-by-finite-period-diagram` |
| /62 | §4.2.1, (4.3), Lemma 4.12, p.38 | `SPM.5/period-domain-decomposition` |
| /71 | Definition 6.1, p.43 | `SPM.1/adelic-lv-locus` |
| /72 | Definitions 1.2 and 6.2, Remark 6.3, pp.2, 43–44 | `SPM.6/s-good-pair`; `SPM.6/lawrence-venkatesh-locus` |
| /73 | Definition 1.7, §1.1.2, p.5 | `SPM.6/period-domain-lv-locus` |
| /74 | Lemma 6.4, footnotes 20–21, p.44 | `SPM.6/adelic-locus-in-lv-locus` |
| /75 | Theorem 6.5, p.44, proof §6.5, p.53 | `SPM.9/lv-locus-finite` |
| /76 | §6, after Theorem 6.5, p.44 | `SPM.9/mordell-reproved` |
| /77 | Remark 6.6, p.46 | `SPM.6/fibre-algebra-points` |
| /78 | Proposition 6.7, pp.46–47; Proposition 1.8, pp.5–6; Remark 1.9, p.6 | `SPM.6/principal-trichotomy` |
| /79 | Definition 6.8, p.47 | `SPM.6/trichotomy-loci` |
| /80 | Proposition 6.9, pp.48–49 | `SPM.7/type-a-period-non-density` |
| /81 | Corollary 6.10, p.48 | `SPM.7/type-a-locus-finite` |
| /82 | Definition 6.11, Lemma 6.12, p.48 | `SPM.7/type-a-classes`; `SPM.7/type-a-classes-finite` |
| /83 | Lemma 6.13, Remark 6.14, pp.48–49 | `SPM.7/type-a-factor-non-density` |
| /84 | §6.3, Proposition 6.15, pp.49–52 | `SPM.7/type-b-period-non-density` |
| /85 | Corollary 6.16, p.50 | `SPM.7/type-b-locus-finite` |
| /86 | Lemma 6.17, (6.1), pp.50–51 | `SPM.7/type-b-factor-non-density` |
| /89 | Proposition 6.20, pp.52–53 | `SPM.8/type-c-empty` |
| /90 | Remark 6.21, p.53 | `SPM.8/small-extension-count` |
| /91 | Corollary 6.22, p.53 | `SPM.8/kodaira-parshin-choice` |
| /93 | Remark 6.23, pp.53–54 | `SPM.8/parameter-comparison` |
| /94 | §7.1, p.55 | `SPM.1/relative-symplectic-pair` |
| /95 | §7.2, (†), p.56 | `SPM.1/section-symplectic-pair` |
| /96 | Proposition 7.2, p.56 | `SPM.1/selmer-pair-interpolates` |
| /97 | Theorem 7.1, pp.54, 56 | `SPM.1/selmer-sections-in-lv-locus` |

The canonical packet has 59 nodes, 125 API entries, 82 definition/construction
tests and 30 planets; none is added here. It also retains 18 supplier requests
and four explicit gaps. Acceptance of the plan does not close those gaps:

- Relative p-adic Hodge specialisation, the spherical-polyannulus Galois
  category, and full faithfulness of D_pH need their supplier contracts.
- The model-free Lawrence–Venkatesh inputs exceed the accepted good-model
  supplier scope, including arbitrary local centres and the four-Lagrangian
  isotropic argument.
- Existing LocalGaloisGroups Layer 7 supplies finite generation of the full
  local absolute Galois group; the atlas still needs its catalogue edge.
- The orbit-dimension bound needs a supplier beyond the stated subgroup and
  quotient scope of ReductiveGroups Layer 3.

The source qualifications and corrections in the accepted reader remain in
force: Proposition 2.19 uses Q_p-valued characters, the general trichotomy
uses the number of Q_p-points of A (equal to its dimension in the split case),
and the parameter condition excludes divisibility of q−1 by four. This audit
does not copy the extraction's older shorthand into replacement statements.

The companion Suggested file contains only this ownership notice. Since the
duplicate identifier owns no declarations, adding theorem skeletons or fake
carriers would recreate the work already owned by the canonical file. Its
successful elaboration checks only this empty Lean interface; it does not
validate the canonical mathematical targets.
